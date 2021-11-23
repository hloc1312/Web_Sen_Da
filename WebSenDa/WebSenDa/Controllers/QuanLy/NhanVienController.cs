using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSenDa.Models;
using System.Data;
using System.Data.Entity;

namespace WebSenDa.Controllers.QuanLy
{
    public class NhanVienController : Controller
    {

        SenDaEntities db = new SenDaEntities();
        // GET: NhanVien
        public ActionResult Index()
        {
            var model = new ViewModel();
            model.ListNhanVien = db.NhanVien.Where(m => m.IDQuyen != 0).ToList();
            return View(model);
        }
        public ActionResult Details(int id)
        {
            var model = new ViewModel();
            model.nhanvien = db.NhanVien.Where(m => m.IDNhanVien == id).SingleOrDefault();

            return View(model);
        }
        public ActionResult Create()
        {
            var model = new ViewModel();

            List<LoaiTaiKhoan> list = db.LoaiTaiKhoan.ToList();
            ViewBag.listLoaiTK = new SelectList(list, "IDLoaiTaiKhoan", "TenLoaiTaiKhoan", 1);
            List<Quyen> listQ = db.Quyen.ToList();
            ViewBag.listQuyen = new SelectList(listQ, "IDQuyen", "TenQuyen", 1);

            model.nhanvien = new Models.NhanVien();

            return View(model);
        }
        [HttpPost]
        public ActionResult Create(ViewModel v)
        {
            Models.NhanVien nv = new Models.NhanVien();
            //ViewBag.IDLoaiTaiKhoan = new SelectList(db.LoaiTaiKhoan, "IDLoaiTaiKhoan", "TenLoaiTaiKhoan", nv.IDLoaiTaiKhoan);
            //ViewBag.IDQuyen = new SelectList(db.Quyen, "IDQuyen", "TenQuyen", nv.IDQuyen);
            var check = db.NhanVien.Where(s => s.IDNhanVien == v.nhanvien.IDNhanVien).FirstOrDefault();
            var check_tk = db.NhanVien.Where(s => s.TenTaiKhoan == v.nhanvien.TenTaiKhoan).FirstOrDefault();
            if (ModelState.IsValid)
            {
                if (check == null && check_tk == null)
                {
                    List<LoaiTaiKhoan> list = db.LoaiTaiKhoan.ToList();
                    ViewBag.listLoaiTK = new SelectList(list, "IDLoaiTaiKhoan", "TenLoaiTaiKhoan", nv.IDLoaiTaiKhoan);
                    List<Quyen> listQ = db.Quyen.ToList();
                    ViewBag.listQuyen = new SelectList(listQ, "IDQuyen", "TenQuyen", nv.IDQuyen);
                    nv = v.nhanvien;
                    db.NhanVien.Add(nv);
                    db.SaveChanges();
                    return RedirectToAction("Index", "NhanVien");

                }
                else
                {
                    ViewBag.Error = "Mã nhân viên hoặc tên tài khoản đã tồn tại";
                    return View();
                }
            }
            return View();
        }

        public ActionResult Edit(int id)
        {
            var model = new ViewModel();
            Models.NhanVien nv = db.NhanVien.Where(n => n.IDNhanVien == id).SingleOrDefault();
            //ViewBag.IDLoaiTaiKhoan = new SelectList(db.LoaiTaiKhoan, "IDLoaiTaiKhoan", "TenLoaiTaiKhoan",nv.IDLoaiTaiKhoan);
            //ViewBag.IDQuyen = new SelectList(db.Quyen, "IDQuyen", "TenQuyen",nv.IDQuyen);
            List<LoaiTaiKhoan> list = db.LoaiTaiKhoan.ToList();
            ViewBag.listLoaiTK = new SelectList(list, "IDLoaiTaiKhoan", "TenLoaiTaiKhoan", nv.IDLoaiTaiKhoan);
            List<Quyen> listQ = db.Quyen.ToList();
            ViewBag.listQuyen = new SelectList(listQ, "IDQuyen", "TenQuyen", nv.IDQuyen);
            model.nhanvien = nv;
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(ViewModel v)
        {
            Models.NhanVien nv = db.NhanVien.Where(m => m.IDNhanVien == v.nhanvien.IDNhanVien).SingleOrDefault();
            if (ModelState.IsValid)
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                nv.TenNhanVien = v.nhanvien.TenNhanVien;
                /*            nv.IDLoaiTaiKhoan = int.Parse(v.nhanvien.IDLoaiTaiKhoan.ToString());
                */
                nv.IDQuyen = int.Parse(v.nhanvien.IDQuyen.ToString());
                nv.AnhDaiDien = v.nhanvien.Email;
                nv.IDLoaiTaiKhoan = v.nhanvien.IDLoaiTaiKhoan;
                nv.SoDienThoai = v.nhanvien.SoDienThoai;
                nv.TenTaiKhoan = v.nhanvien.TenTaiKhoan;
                nv.MatKhau = v.nhanvien.MatKhau;
                nv.CMND = v.nhanvien.CMND;
                nv.Email = v.nhanvien.Email;
                nv.AnhDaiDien = v.nhanvien.AnhDaiDien;
                db.NhanVien.Attach(nv);
                db.Entry(nv).State = EntityState.Modified;
                db.SaveChanges();
                //ViewBag.IDLoaiTaiKhoan = new SelectList(db.LoaiTaiKhoan, "IDLoaiTaiKhoan", "TenLoaiTaiKhoan", nv.IDLoaiTaiKhoan);
                //ViewBag.IDQuyen = new SelectList(db.Quyen, "IDQuyen", "TenQuyen", nv.IDQuyen);
                List<LoaiTaiKhoan> list = db.LoaiTaiKhoan.ToList();
                ViewBag.listLoaiTK = new SelectList(list, "IDLoaiTaiKhoan", "TenLoaiTaiKhoan", nv.IDLoaiTaiKhoan);
                List<Quyen> listQ = db.Quyen.ToList();
                ViewBag.listQuyen = new SelectList(listQ, "IDQuyen", "TenQuyen", nv.IDQuyen);
                return RedirectToAction("Index", "NhanVien");

            }
            return View();
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult Delete(int submit)
        {
            Models.NhanVien nv = db.NhanVien.Where(m => m.IDNhanVien == submit).SingleOrDefault();
            nv.IDQuyen = 4;
            db.SaveChanges();
            return Redirect("Index");
        }
        //public ActionResult SelectQuyen()
        //{
        //    Quyen r = new Quyen();
        //    r.listRole = db.Quyen.ToList<Quyen>();
        //    return PartialView(r);
        //}
    }
}