using Floricultura.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace Floricultura.Controllers
{
    public class PlantController : Controller
    {
        private readonly IPlantRepository _plantRepository;

        public PlantController(IPlantRepository plantRepository)
        {
            _plantRepository = plantRepository;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _plantRepository.GetAll());
        }
    }
}
