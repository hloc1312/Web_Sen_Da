using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSenDa.Models;
using System.Data;
using System.Data.Entity;
namespace WebSenDa.Controllers.NhanVien
{
    public class DonHangController : Controller
    {
        // GET: DonHang
        SenDaEntities db = new SenDaEntities();
        public ActionResult Index()
        {
            ViewModel v = new ViewModel();
            v.ListDonHang = db.DonHang.ToList();
            return View(v);
        }
        public ActionResult Detail(int id, string giao, string duyet,string huy, string dangGiao)
        {
            ViewModel v = new ViewModel();
            v.donhang = db.DonHang.Where(m => m.IDDonHang == id).Single();
            v.ListCT_DonHang = db.ChiTietDonHang.Where(m => m.IDDonHang == id).ToList();
            if (!string.IsNullOrEmpty(duyet))
            {
                DonHang dh = new DonHang();
                dh = db.DonHang.Where(m => m.IDDonHang == id).SingleOrDefault();
                dh.TrangThai = 1;
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            if (!string.IsNullOrEmpty(huy))
            {
                DonHang dh = new DonHang();
                dh = db.DonHang.Where(m => m.IDDonHang == id).SingleOrDefault();
                dh.TrangThai = 4;
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            if (!string.IsNullOrEmpty(giao))
            {
                DonHang dh = new DonHang();
                dh = db.DonHang.Where(m => m.IDDonHang == id ).Single();
                dh.TrangThai = 2;
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            if (!string.IsNullOrEmpty(dangGiao))
            {
                DonHang dh = new DonHang();
                dh = db.DonHang.Where(m => m.IDDonHang == id).Single();
                dh.TrangThai = 3;
                db.Entry(dh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }


            return View(v);
        }

       
    }
}