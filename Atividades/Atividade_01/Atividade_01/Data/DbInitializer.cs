using Atividade_01.Models;

namespace Atividade_01.Data
{
    public class DbInitializer
    {
        public static void Initialize(CompanyContext context)
        {
            context.Database.EnsureCreated();

            if(context.Users.Any() || context.Properties.Any())
            {
                return;   // DB has been seeded
            }

            var userTypes = new UserType[]
            {
                new UserType{TypeName="Vendedor"},
                new UserType{TypeName="Funcionario"},
            };

            var addresses = new Address[]
            {
                new Address{Country="Brasil",State="Estado A",City="Cidade A",Neighborhood="Bairro A",Street="Rua A",HouseNumber=1, ZipCode="12345-679"},
                new Address{Country="Brasil",State="Estado B",City="Cidade B",Neighborhood="Bairro B",Street="Rua B",HouseNumber=2, ZipCode="12345-680"},
                new Address{Country="Brasil",State="Estado B",City="Cidade B",Neighborhood="Bairro B",Street="Rua B",HouseNumber=2, ZipCode="12345-681"},
                
            };
            var users = new Users[]
            {
                new Users{UserName="User A",Password="Senha a",Email="Email a",DocumentNumber="12345",PhoneNumber="12354",AddressId=1,UserTypeId=1},
                new Users{UserName="User B",Password="Senha B",Email="Email B",DocumentNumber="12345",PhoneNumber="12354",AddressId=2,UserTypeId=2},
                new Users{UserName="User C",Password="Senha C",Email="Email C",DocumentNumber="12345",PhoneNumber="12354",AddressId=3,UserTypeId=2}
            };

            var properties = new Property[]
            {
                new Property{Colour="Branco",SizeM2=123,BedroomNumber=2,BathroomNumber=3,Value=100000,PropertyCategoryId=1, AddressId = 1},
                new Property{Colour="Preto",SizeM2=123,BedroomNumber=2,BathroomNumber=3,Value=200000,PropertyCategoryId=2,AddressId=2},
                new Property{Colour="Azul",SizeM2=123,BedroomNumber=2,BathroomNumber=3,Value=300000,PropertyCategoryId=3,AddressId=3},
            };

            var propertyCategories = new PropertyCategory[]
            {
                new PropertyCategory{CategoryDescription="Casa"},
                new PropertyCategory{CategoryDescription="Apartamento"},
                new PropertyCategory{CategoryDescription="Terreno"}
            };

            foreach (UserType ut in userTypes)
            {
                context.UserTypes.Add(ut);
            }
            context.SaveChanges();

            foreach (Address a in addresses)
            {
                context.Addresses.Add(a);
            }
            context.SaveChanges();

            foreach (Users u in users)
            {
                context.Users.Add(u);
            }
            context.SaveChanges();

            foreach (Property p in properties)
            {
                context.Properties.Add(p);
            }
            context.SaveChanges();

            foreach (PropertyCategory pc in propertyCategories)
            {
                context.PropertyCategories.Add(pc);
            }
            context.SaveChanges();
        }
    }
}
