using Floricultura.Models;
using Microsoft.EntityFrameworkCore;

namespace Floricultura.Data
{
    public class FloriculturaContext : DbContext
    {
        public FloriculturaContext(DbContextOptions<FloriculturaContext> options) : base(options)
        {

        }

        public DbSet<Plant> Plant { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Plant>().ToTable("Plants");

        }
    }
}
