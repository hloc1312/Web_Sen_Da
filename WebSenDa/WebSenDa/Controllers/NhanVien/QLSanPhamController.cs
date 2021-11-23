using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSenDa.Models;
using System.Data.Entity;

namespace WebSenDa.Controllers.NhanVien
{
    public class QLSanPhamController : Controller
    {
        // GET: SanPham
        SenDaEntities db = new SenDaEntities();
        public ActionResult Index(string search)
        {
            ViewModel v = new ViewModel();
            if (search == "" || search == null)
            {
                v.ListSanPham = db.SanPham.ToList();
                return View("Index", v);
            }
            else
            {
                v.ListSanPham = db.SanPham.Where(m=>m.TenSanPham.Contains(search)).ToList();
                return View("Index", v);
            }
                
        }
        public ActionResult Details(int id)
        {
            ViewModel v = new ViewModel();
            v.sanPham = db.SanPham.Where(m => m.IDSanPham == id).SingleOrDefault();
            return View(v);
        }

        public ActionResult Create()
        {
            ViewModel v = new ViewModel();
            v.sanPham = new SanPham();
            v.nhapKho = new NhapKho();
            v.kho = new Kho();
            List<LoaiSanPham> sp = db.LoaiSanPham.ToList();
            ViewBag.ListLoaiSanPham = new SelectList(sp, "IDLoaiSanPham", "TenLoaiSanPham");
            ViewBag.ListLoaiSenDa= new SelectList(db.LoaiSenDa.ToList(), "IDLoaiSenDa", "TenLoaiSenDa");
            ViewBag.ListLoaiChauCay = new SelectList(db.LoaiChauCay.ToList(), "IDLoaiChauCay", "TenLoaiChauCay");
            ViewBag.ListLoaiGiaThe = new SelectList(db.LoaiGiaThe.ToList(), "IDLoaiGiaThe", "TenLoaiGiaThe");
            ViewBag.ListKhuyenMai = new SelectList(db.KhuyenMai.ToList(), "IDKhuyenMai", "GiaTriKhuyenMai");
            v.ListLoaiSanPham = db.LoaiSanPham.ToList();
            return View(v);
        }
        [HttpPost]
        public ActionResult Create(ViewModel v)
        {
            ViewBag.ListLoaiSanPham = new SelectList(db.LoaiSanPham.ToList(), "IDLoaiSanPham", "TenLoaiSanPham");
            ViewBag.ListLoaiSenDa = new SelectList(db.LoaiSenDa.ToList(), "IDLoaiSenDa", "TenLoaiSenDa");
            ViewBag.ListLoaiChauCay = new SelectList(db.LoaiChauCay.ToList(), "IDLoaiChauCay", "TenLoaiChauCay");
            ViewBag.ListLoaiGiaThe = new SelectList(db.LoaiGiaThe.ToList(), "IDLoaiGiaThe", "TenLoaiGiaThe");
            ViewBag.ListKhuyenMai = new SelectList(db.KhuyenMai.ToList(), "IDKhuyenMai", "GiaTriKhuyenMai");
            SanPham s = new SanPham();
            NhapKho nk = new NhapKho();
            Kho kho = new Kho();
            var check = db.SanPham.Where(x => x.IDSanPham == v.sanPham.IDSanPham).FirstOrDefault();
            if(check == null)
            {
                s.Hinh1 = v.sanPham.Hinh1;
                s.Hinh = v.sanPham.Hinh;
                s.Hinh2 = v.sanPham.Hinh2;
                s.Hinh3 = v.sanPham.Hinh3;
                s.IDLoaiSanPham = v.sanPham.IDLoaiSanPham;
                s.IDLoaiChauCay = v.sanPham.IDLoaiChauCay;
                s.IDLoaiGiaThe = v.sanPham.IDLoaiGiaThe;
                s.IDLoaiSenDa = v.sanPham.IDLoaiSenDa;
                s.IDKhuyenMai = v.sanPham.IDKhuyenMai;
                s.MoTa = v.sanPham.MoTa;
                s.TenSanPham = v.sanPham.TenSanPham;
                nk.IDSanPham = v.sanPham.IDSanPham;
                nk.NgayNhap = DateTime.Now;
                nk.SoLuongNhap = v.nhapKho.SoLuongNhap;
                kho.SoLuongTon = v.nhapKho.SoLuongNhap;
                kho.IDSanPham = v.sanPham.IDSanPham;
                kho.GiaBan = v.kho.GiaBan;
                db.SanPham.Add(s);
                db.Kho.Add(kho);
                db.NhapKho.Add(nk);

                db.SaveChanges();

                return RedirectToAction("Index","QLSanPham");

            }
            else
            {
                ViewBag.Error = "Mã sản phẩm đã tồn tại";
                return View();
            }

        }
        public ActionResult Edit(int id)
        {
            ViewModel v = new ViewModel();
            v.sanPham = db.SanPham.Where(n => n.IDSanPham == id).Single();
            v.kho = db.Kho.Where(n => n.IDSanPham == id).Single();
            List<LoaiSanPham> sp = db.LoaiSanPham.ToList();
            ViewBag.ListLoaiSanPham = new SelectList(sp, "IDLoaiSanPham", "TenLoaiSanPham",v.sanPham.IDLoaiSanPham);
            ViewBag.ListLoaiSenDa = new SelectList(db.LoaiSenDa.ToList(), "IDLoaiSenDa", "TenLoaiSenDa", v.sanPham.IDLoaiSenDa);
            ViewBag.ListLoaiChauCay = new SelectList(db.LoaiChauCay.ToList(), "IDLoaiChauCay", "TenLoaiChauCay", v.sanPham.IDLoaiChauCay);
            ViewBag.ListLoaiGiaThe = new SelectList(db.LoaiGiaThe.ToList(), "IDLoaiGiaThe", "TenLoaiGiaThe", v.sanPham.IDLoaiGiaThe);
            ViewBag.ListKhuyenMai = new SelectList(db.KhuyenMai.ToList(), "IDKhuyenMai", "GiaTriKhuyenMai", v.sanPham.IDKhuyenMai);
            return View(v);
        }

        [HttpPost]
        public ActionResult Edit(ViewModel v)
        {
            if (ModelState.IsValid)
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                List<LoaiSanPham> sp = db.LoaiSanPham.ToList();
                ViewBag.ListLoaiSanPham = new SelectList(sp, "IDLoaiSanPham", "TenLoaiSanPham", v.sanPham.IDLoaiSanPham);
                ViewBag.ListLoaiSenDa = new SelectList(db.LoaiSenDa.ToList(), "IDLoaiSenDa", "TenLoaiSenDa", v.sanPham.IDLoaiSenDa);
                ViewBag.ListLoaiChauCay = new SelectList(db.LoaiChauCay.ToList(), "IDLoaiChauCay", "TenLoaiChauCay", v.sanPham.IDLoaiChauCay);
                ViewBag.ListLoaiGiaThe = new SelectList(db.LoaiGiaThe.ToList(), "IDLoaiGiaThe", "TenLoaiGiaThe", v.sanPham.IDLoaiGiaThe);
                ViewBag.ListKhuyenMai = new SelectList(db.KhuyenMai.ToList(), "IDKhuyenMai", "GiaTriKhuyenMai", v.sanPham.IDKhuyenMai);
                SanPham s = db.SanPham.Where(n => n.IDSanPham == v.sanPham.IDSanPham).Single();
                Kho kho = db.Kho.Where(n => n.IDSanPham == v.sanPham.IDSanPham).Single();

    /*            s.IDSanPham = v.sanPham.IDSanPham;
    */          s.Hinh1 = v.sanPham.Hinh1;
                s.Hinh = v.sanPham.Hinh;
                s.Hinh2 = v.sanPham.Hinh2;
                s.Hinh3 = v.sanPham.Hinh3;
                s.IDLoaiSanPham = v.sanPham.IDLoaiSanPham;
                s.IDLoaiChauCay = v.sanPham.IDLoaiChauCay;
                s.IDLoaiGiaThe = v.sanPham.IDLoaiGiaThe;
                s.IDLoaiSenDa = v.sanPham.IDLoaiSenDa;
                s.IDKhuyenMai = v.sanPham.IDKhuyenMai;
                s.MoTa = v.sanPham.MoTa;
                s.TenSanPham = v.sanPham.TenSanPham;

    /*            kho.SoLuongTon = v.nhapKho.SoLuongNhap;
    *//*            kho.IDSanPham = v.sanPham.IDSanPham;
    */            kho.GiaBan = v.kho.GiaBan;
                db.SanPham.Attach(s);
                db.Kho.Attach(kho);
                db.Entry(s).State = EntityState.Modified;
                db.Entry(kho).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", "QLSanPham");

            }
            return View();
        }
        public ActionResult AddDonNhap(int id)
        {
            ViewModel v = new ViewModel();
            NhapKho nk = new NhapKho();
            v.nhapKho = nk;
            v.nhapKho.IDSanPham = id;
            return View(v);
        }
        [HttpPost]
        public ActionResult AddDonNhap(ViewModel v)
        {
            if (ModelState.IsValid)
            {
                    NhapKho nk = new NhapKho();
                    nk.IDSanPham = v.nhapKho.IDSanPham;
                    nk.NgayNhap = DateTime.Now;
                    nk.SoLuongNhap = v.nhapKho.SoLuongNhap;
                    nk.GiaNhap = v.nhapKho.GiaNhap;
                    db.NhapKho.Add(nk);
                    db.SaveChanges();
                    return RedirectToAction("Details"+"/"+nk.IDSanPham,"QLSanPham");

            }
            return View();

            //NhapKho nk = new NhapKho();
            //nk.IDSanPham = v.nhapKho.IDSanPham;
            //nk.NgayNhap = DateTime.Now;
            //nk.SoLuongNhap = v.nhapKho.SoLuongNhap;
            //nk.GiaNhap = v.nhapKho.GiaNhap;
            //Kho kho = db.Kho.Where(m => m.IDSanPham == v.nhapKho.IDSanPham).SingleOrDefault();
            //kho.IDSanPham += v.nhapKho.SoLuongNhap;
            //db.Entry(kho).State = EntityState.Modified;
            //db.NhapKho.Add(nk);
            //db.SaveChanges();
            //return View(v);
        }

    }
}