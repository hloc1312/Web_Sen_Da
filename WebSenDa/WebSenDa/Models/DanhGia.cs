//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebSenDa.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DanhGia
    {
        public int IDKhachHang { get; set; }
        public int IDSanPham { get; set; }
        public string NoiDung { get; set; }
        public string Hinh { get; set; }
        public string Hinh1 { get; set; }
        public string Hinh2 { get; set; }
        public System.DateTime NgayDanhGia { get; set; }
    
        public virtual KhachHang KhachHang { get; set; }
        public virtual SanPham SanPham { get; set; }
    }
}
