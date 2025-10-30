using Floricultura.Data;
using Floricultura.Interfaces;
using Floricultura.Models;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.EntityFrameworkCore;

namespace Floricultura.Repository
{
    public class PlantRepository : IPlantRepository
    {
        private readonly FloriculturaContext _context;

        public PlantRepository(FloriculturaContext context)
        {
            _context = context;
        }

        public async Task Create(Plant plant)
        {
            await _context.Plant.AddAsync(plant);
            await _context.SaveChangesAsync();
        }

        public async Task Delete(int id)
        {
            var plant = await _context.Plant.FindAsync(id);
            if (plant != null)
            {
                _context.Plant.Remove(plant);
                await _context.SaveChangesAsync();
            }
        }

        public async Task<List<Plant>> GetAll()
        {
            var data = await _context.Plant.ToListAsync();
            return data;
        }

        public async Task<Plant> GetById(int id)
        {
            var plant = await _context.Plant.Where(p =>p.id == id).FirstOrDefaultAsync();
            return plant!;
        }

        public async Task Update(Plant plant)
        {
            _context.Plant.Update(plant);
            await _context.SaveChangesAsync();
        }
    }
}
