using System.ComponentModel.DataAnnotations;

namespace Atividade_01.Models
{
    public class PropertyCategory
    {
        [Key]
        public int Id { get; set; }
        public string? CategoryDescription { get; set; }
        public List<Property>? Properties { get; set; }
    }
}
