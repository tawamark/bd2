using Atividade_01.Models;
using Microsoft.EntityFrameworkCore;

namespace Atividade_01.Data
{
    public class CompanyContext : DbContext
    {

        public CompanyContext(DbContextOptions<CompanyContext> options) : base(options)
        {

        }

        public DbSet<PropertyCategory> PropertyCategories { get; set; }
        public DbSet<Property> Properties { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<Users> Users { get; set; }
        public DbSet<UserType> UserTypes { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PropertyCategory>().ToTable("PropertyCategory");
            modelBuilder.Entity<Property>().ToTable("Property");
            modelBuilder.Entity<Address>().ToTable("Address");
            modelBuilder.Entity<Users>().ToTable("Users");
            modelBuilder.Entity<UserType>().ToTable("UserType");
        }
    }
}
