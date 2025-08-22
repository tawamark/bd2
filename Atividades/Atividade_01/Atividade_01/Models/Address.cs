using System.ComponentModel.DataAnnotations;

namespace Atividade_01.Models
{
    public class Address
    {
        [Key]
        public int Id { get; set; }
        public string? Country { get; set; }
        public string? State { get; set; }
        public string? City { get; set; }
        public string? Neighborhood { get; set; }
        public string? Street { get; set; }
        public int HouseNumber {  get; set; }
        public string? ZipCode { get; set; }
    }
}
