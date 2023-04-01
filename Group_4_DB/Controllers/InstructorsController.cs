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
    public class InstructorsController : ControllerBase
    {
        private readonly academic_settingsContext _context;

        public InstructorsController(academic_settingsContext context)
        {
            _context = context;
        }

        // GET: api/Instructors
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Instructors>>> GetInstructors()
        {
          if (_context.Instructors == null)
          {
              return NotFound();
          }
            return await _context.Instructors.ToListAsync();
        }

        // GET: api/Instructors/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Instructors>> GetInstructors(string id)
        {
          if (_context.Instructors == null)
          {
              return NotFound();
          }
            var instructors = await _context.Instructors.FindAsync(id);

            if (instructors == null)
            {
                return NotFound();
            }

            return instructors;
        }

        // PUT: api/Instructors/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInstructors(string id, Instructors instructors)
        {
            if (id != instructors.InstructorId)
            {
                return BadRequest();
            }

            _context.Entry(instructors).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InstructorsExists(id))
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

        // POST: api/Instructors
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Instructors>> PostInstructors(Instructors instructors)
        {
          if (_context.Instructors == null)
          {
              return Problem("Entity set 'academic_settingsContext.Instructors'  is null.");
          }
            _context.Instructors.Add(instructors);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InstructorsExists(instructors.InstructorId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInstructors", new { id = instructors.InstructorId }, instructors);
        }

        // DELETE: api/Instructors/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInstructors(string id)
        {
            if (_context.Instructors == null)
            {
                return NotFound();
            }
            var instructors = await _context.Instructors.FindAsync(id);
            if (instructors == null)
            {
                return NotFound();
            }

            _context.Instructors.Remove(instructors);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InstructorsExists(string id)
        {
            return (_context.Instructors?.Any(e => e.InstructorId == id)).GetValueOrDefault();
        }
    }
}
