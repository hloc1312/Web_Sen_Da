using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using WebSenDa.Models;

namespace WebSenDa.Controllers
{
    public class SanPhamController : Controller
    {
        SenDaEntities db = new SenDaEntities();
        // GET: SanPham
        public ActionResult Index()
        {
            var model = new ViewModel();

            model.ListSanPham = db.SanPham.ToArray();
            model.ListLoaiSanPham = db.LoaiSanPham.ToArray();
            model.ListLoaiSenDa = db.LoaiSenDa.ToArray();
            model.ListLoaiChauCay = db.LoaiChauCay.ToArray();
            model.ListLoaiGiaThe = db.LoaiGiaThe.ToArray();
            model.ListKhuyenMai = db.KhuyenMai.ToArray();
            model.ListKho = db.Kho.ToArray();
            model.ListNhapKho = db.NhapKho.ToArray();

            return View(model);
        }

        //Get: Sanpham/LocLoaiSP/idLoaiSP
        public ActionResult LocLoaiSP(int id)
        {
            var model = new ViewModel();
            model.ListSanPham = db.SanPham.ToArray();
            model.ListLoaiSanPham = db.LoaiSanPham.ToArray();
            model.ListKhuyenMai = db.KhuyenMai.ToArray();
            model.ListKho = db.Kho.ToArray();
            model.ListNhapKho = db.NhapKho.ToArray();
            model.sanPham = db.SanPham.Where(x => x.IDLoaiSanPham == id).FirstOrDefault();

            return View(model);
        }
        //Get: SanPham/AllSP
        public ActionResult AllSP()
        {
            var model = new ViewModel();

            model.ListSanPham = db.SanPham.ToArray();
            model.ListLoaiSanPham = db.LoaiSanPham.ToArray();            
            model.ListKhuyenMai = db.KhuyenMai.ToArray();
            model.ListKho = db.Kho.ToArray();
            model.ListNhapKho = db.NhapKho.ToArray();

            return View(model);
        }

        // GET: SanPham/Details/idSP
        public ActionResult Details(int id)
        {

            var model = new ViewModel();
            model.ListSanPham = db.SanPham.ToArray();
            model.ListLoaiSanPham = db.LoaiSanPham.ToArray();
            model.ListLoaiSenDa = db.LoaiSenDa.ToArray();
            model.ListLoaiChauCay = db.LoaiChauCay.ToArray();
            model.ListLoaiGiaThe = db.LoaiGiaThe.ToArray();
            model.ListKhuyenMai = db.KhuyenMai.ToArray();
            model.ListKho = db.Kho.ToArray();
            model.ListNhapKho = db.NhapKho.ToArray();
            model.ListDanhGia = db.DanhGia.ToArray();
            model.sanPham = db.SanPham.Where(x => x.IDSanPham == id).FirstOrDefault();

            return View(model);
        }

       

        private static Expression<Func<SanPham, bool>> NewMethod(int id)
        {
            return model => model.IDSanPham == id;
        }

        // GET: SanPham/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SanPham/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: SanPham/Edit/idSP
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: SanPham/Edit/idSP
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: SanPham/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SanPham/Delete/idSP
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }    
}
