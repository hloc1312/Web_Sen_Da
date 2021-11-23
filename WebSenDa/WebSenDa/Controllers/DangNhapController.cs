using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebSenDa.Models;

namespace WebSenDa.Controllers
{
    public class DangNhapController : Controller
    {
        // GET: DangNhap
        SenDaEntities db = new SenDaEntities();
        [HttpGet]
        public ActionResult Login()
        {
            ViewModel v = new ViewModel();
            Models.NhanVien nv = new Models.NhanVien();
            v.nhanvien = nv;
            return View(v);
        }
        [HttpPost]
        public ActionResult Login(ViewModel v)
        {

            //var check = db.NhanVien.Where(s => s.TenTaiKhoan == v.nhanvien.TenTaiKhoan && s.MatKhau == v.nhanvien.MatKhau).SingleOrDefault();
            //if (ModelState.IsValid)
            //{
            //    if (check == null)
            //    {
            //        if (v.nhanvien.TenTaiKhoan == "Ruby" && v.nhanvien.MatKhau == "Ruby")
            //        {
            //            //Chuyển sang quản lý
            //            Session["LoaiAccount"] = 1;
            //        }
            //        else
            //        {
            //            //thông báo sai 
            //        }

            //    }
            //    else 
            //    {
            //        if(check.IDQuyen==2)
            //        {
            //            Session["LoaiAccount"] = 2;
            //            //chuyển qua nv bán hàng 
            //        }
            //        else if(check.IDQuyen==3)
            //        {
            //            Session["LoaiAccount"] = 3;
            //            //chuyển qua nv bán hàng 
            //        }
            //        else
            //        {
            //            //Thông báo sai do bị xóa r á
            //        }    


            //    }
            //}
            //else
            //{

            //    return View("Login");
            //}

            var check_tt = db.NhanVien.Where(s => s.TenTaiKhoan == v.nhanvien.TenTaiKhoan && s.MatKhau == v.nhanvien.MatKhau && s.IDQuyen != 0).SingleOrDefault();
            //if (ModelState.IsValid)
            //{
            if (check_tt == null)
            {
                //if (v.nhanvien.TenTaiKhoan == "admin" && v.nhanvien.MatKhau == "admin")
                //{
                //    //Chuyển sang quản lý
                //    Session["LoaiAccount"] = 1;
                //    return RedirectToAction("Index", "QLSanPham");

                //}
                ViewBag.Error = "Sai thông tin đăng nhập";
                return View("Login");
            }
            else 
                {
                    FormsAuthentication.SetAuthCookie(v.nhanvien.TenTaiKhoan, false);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    Session["TenTaiKhoan"] = v.nhanvien.TenTaiKhoan;    
                    //return RedirectToAction("Index", "QLSanPham");
                    if (User.IsInRole("Admin"))
                    {
                        return RedirectToAction("Index", "Quyen");
                    }
                    else if (check_tt.IDQuyen==2)
                    {
                        return RedirectToAction("Index", "QLSanPham");
                    }
                    else 
                    {
                        return RedirectToAction("Index", "DonHang");
                    }

               
            }
            //}
            //return View();
            //else
            //{
            //    return View("Login");
            //}

            //return View(v);
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "DangNhap");
        }
    }
}