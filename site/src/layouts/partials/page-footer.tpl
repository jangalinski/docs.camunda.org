
  <script type="text/javascript">var siteMenu = <%= JSON.stringify(navigation, null, 2) %>;</script>
  <script src="/scripts/index.js"></script>

  <!-- scripts -->
  <script>
    !function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (!d.getElementById(id)) {
        js = d.createElement(s);
        js.id = id;
        js.async=true;
        js.defer='defer';
        js.src = "//platform.twitter.com/widgets.js";
        fjs.parentNode.insertBefore(js, fjs);
      }
    }(document, "script", "twitter-wjs");
  </script>