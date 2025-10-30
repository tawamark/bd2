using Floricultura.Models;

namespace Floricultura.Data
{
    public class DbInitializer
    {
        public static void Initialize(FloriculturaContext context)
        {
            context.Database.EnsureCreated();

            // Look for any plants.
            if (context.Plant.Any())
            {
                return;   // DB has been seeded
            }

            var plants = new Plant[]
            {
                new Plant { Name = "Rosa", SensorValue = 23.5f, SensorEvent = 1.0f },
                new Plant { Name = "Orquídea", SensorValue = 18.2f, SensorEvent = 0.0f },
                new Plant { Name = "Girassol", SensorValue = 30.1f, SensorEvent = 1.0f },
                new Plant { Name = "Lírio", SensorValue = 15.7f, SensorEvent = 0.0f },
                new Plant { Name = "Violeta", SensorValue = 20.0f, SensorEvent = 1.0f }
            };
            foreach (Plant p in plants)
            {
                context.Plant.Add(p);
            }
            context.SaveChanges();
        }
    }
}
