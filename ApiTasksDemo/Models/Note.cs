using System;
using System.ComponentModel.DataAnnotations;

namespace ApiTasksDemo.Models
{
    public partial class Note
    {
        [Key]
        public int NoteId { get; set; }
        [Required]
        public string Title { get; set; }
        public string Description { get; set; }
        public bool IsCompleted { get; set; }
        [Required]
        [Range(1, 3)]
        public int Priority { get; set; }
        [Required]
        public DateTime ExpirationDate { get; set; }
    }
}
