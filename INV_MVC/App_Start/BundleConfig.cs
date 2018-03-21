
using System.Web;
using System.Web.Optimization;

namespace INV_MVC
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            /*CSS*/
            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.min.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Content/cssothers").Include(
                     
                     "~/Content/datepicker3.css",
                     "~/Content/styles.css"
                     ));

            bundles.Add(new StyleBundle("~/Content/font-awesome").Include(
                "~/Content/font-awesome.min.css"
                ));
            /*CSS*/
            /*Js*/
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            bundles.Add(new ScriptBundle("~/bundles/unobtrusive").Include("~/Scripts/jquery.unobtrusive-ajax.min.js"));
            bundles.Add(new ScriptBundle("~/bundles/modalform").Include("~/Scripts/app/modalform.js"));


            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));
            /*Js*/

            bundles.Add(new ScriptBundle("~/bundles/jasny").Include("~/Scripts/jasny/jasny-bootstrap.min.js"));
            bundles.Add(new StyleBundle("~/Content/jasny").Include("~/Content/jasny/jasny-bootstrap.min.css"));

        }
    }
}