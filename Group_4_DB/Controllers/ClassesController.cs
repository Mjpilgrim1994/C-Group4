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
    public class ClassesController : ControllerBase
    {
        private readonly academic_settingsContext _context;

        public ClassesController(academic_settingsContext context)
        {
            _context = context;
        }

        // GET: api/Classes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Classes>>> GetClasses()
        {
          if (_context.Classes == null)
          {
              return NotFound();
          }
            return await _context.Classes.ToListAsync();
        }

        // GET: api/Classes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Classes>> GetClasses(string id)
        {
          if (_context.Classes == null)
          {
              return NotFound();
          }
            var classes = await _context.Classes.FindAsync(id);

            if (classes == null)
            {
                return NotFound();
            }

            return classes;
        }

        // PUT: api/Classes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutClasses(string id, Classes classes)
        {
            if (id != classes.ClassId)
            {
                return BadRequest();
            }

            _context.Entry(classes).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClassesExists(id))
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

        // POST: api/Classes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Classes>> PostClasses(Classes classes)
        {
          if (_context.Classes == null)
          {
              return Problem("Entity set 'academic_settingsContext.Classes'  is null.");
          }
            _context.Classes.Add(classes);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ClassesExists(classes.ClassId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetClasses", new { id = classes.ClassId }, classes);
        }

        // DELETE: api/Classes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteClasses(string id)
        {
            if (_context.Classes == null)
            {
                return NotFound();
            }
            var classes = await _context.Classes.FindAsync(id);
            if (classes == null)
            {
                return NotFound();
            }

            _context.Classes.Remove(classes);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ClassesExists(string id)
        {
            return (_context.Classes?.Any(e => e.ClassId == id)).GetValueOrDefault();
        }
    }
}
