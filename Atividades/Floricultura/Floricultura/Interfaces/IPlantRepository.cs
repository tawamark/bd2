using Floricultura.Models;

namespace Floricultura.Interfaces
{
    public interface IPlantRepository
    {
        public Task Create(Plant plant);
        public Task Update(Plant plant);
        public Task Delete(int id);
        public Task<Plant> GetById(int id);
        public Task<List<Plant>> GetAll();
    }
}
