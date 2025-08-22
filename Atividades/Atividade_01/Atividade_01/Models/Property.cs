using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Atividade_01.Models
{
    public class Property
    {
        [Key]
        public int Id { get; set; }
        public string? Colour { get; set; }
        public float SizeM2 { get; set; }
        public int BedroomNumber { get; set; }
        public int BathroomNumber { get; set; }
        public float Value { get; set; }
        public int PropertyCategoryId { get; set; }
        [ForeignKey("PropertyCategoryId")]
        public PropertyCategory? PropertyCategory { get; set; }
        public int AddressId { get; set; }
        [ForeignKey("AddressId")]
        public Address? Address { get; set; }

    }
}
