using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Group_4_DB.Data;
using Group_4_DB.Models;

namespace Group_4_DB.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MajorsController : ControllerBase
    {
        private readonly academic_settingsContext _context;

        public MajorsController(academic_settingsContext context)
        {
            _context = context;
        }

        // GET: api/Majors
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Majors>>> GetMajors()
        {
          if (_context.Majors == null)
          {
              return NotFound();
          }
            return await _context.Majors.ToListAsync();
        }

        // GET: api/Majors/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Majors>> GetMajors(string id)
        {
          if (_context.Majors == null)
          {
              return NotFound();
          }
            var majors = await _context.Majors.FindAsync(id);

            if (majors == null)
            {
                return NotFound();
            }

            return majors;
        }

        // PUT: api/Majors/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMajors(string id, Majors majors)
        {
            if (id != majors.MajorId)
            {
                return BadRequest();
            }

            _context.Entry(majors).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MajorsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Majors
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Majors>> PostMajors(Majors majors)
        {
          if (_context.Majors == null)
          {
              return Problem("Entity set 'academic_settingsContext.Majors'  is null.");
          }
            _context.Majors.Add(majors);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (MajorsExists(majors.MajorId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetMajors", new { id = majors.MajorId }, majors);
        }

        // DELETE: api/Majors/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMajors(string id)
        {
            if (_context.Majors == null)
            {
                return NotFound();
            }
            var majors = await _context.Majors.FindAsync(id);
            if (majors == null)
            {
                return NotFound();
            }

            _context.Majors.Remove(majors);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MajorsExists(string id)
        {
            return (_context.Majors?.Any(e => e.MajorId == id)).GetValueOrDefault();
        }
    }
}
