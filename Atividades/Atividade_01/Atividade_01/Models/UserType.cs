namespace Atividade_01.Models
{
    public class UserType
    {
        public int Id { get; set; }
        public string? TypeName { get; set; }
        public List<Users>? Users { get; set; }
    }
}
