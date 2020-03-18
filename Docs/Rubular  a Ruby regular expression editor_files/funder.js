(function() {
  function embed () {
    var evt = new Event('codefund');
    var uplift = {};

    function trackUplift() {
      try {
        var url = 'https://codefund.io/impressions/f19dafba-cd20-4eef-b69f-5a19eff3ba05/uplift?advertiser_id=160';
        console.log('CodeFund is recording uplift. ' + url);
        var xhr = new XMLHttpRequest();
        xhr.open('POST', url);
        xhr.send();
      } catch (e) {
        console.log('CodeFund was unable to record uplift! ' + e.message);
      }
    };

    function verifyUplift() {
      if (uplift.pixel1 === undefined || uplift.pixel2 === undefined) { return; }
      if (uplift.pixel1 && !uplift.pixel2) { trackUplift(); }
    }

    function detectUplift(count) {
      var url = 'https://cdn2.codefund.app/assets/px.js';
      if (url.length === 0) { return; }
      var xhr = new XMLHttpRequest();
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
          if (xhr.status >= 200 && xhr.status < 300) {
            if (count === 1) { detectUplift(2); }
            uplift['pixel' + count] = true;
          } else {
            uplift['pixel' + count] = false;
          }
          verifyUplift();
        }
      };
      xhr.open('GET', url + '?ch=' + count + '&rnd=' + Math.random() * 11);
      xhr.send();
    }

    function elementVisible(element) {
      if (!element) { return false; }

      while (element) {
        var style = getComputedStyle(element);
        if (style.visibility === 'hidden' || style.display === 'none') { return false; }
        element = element.parentElement;
      }

      return true;
    }

    function closeCodeFund() {
      var codeFundElement = document.getElementById('codefund') || document.getElementById('codefund_ad');
      codeFundElement.remove();
      sessionStorage.setItem('codefund', 'closed');
    }

    try {
      if (sessionStorage.getItem('codefund') === 'closed') { return; }

      var codeFundElement = document.getElementById('codefund') || document.getElementById('codefund_ad');
      if (!elementVisible(codeFundElement)) {
        console.log('CodeFund element not visible! Please verify an element exists with id="codefund" and that it is visible.');
        return;
      }

      codeFundElement.innerHTML = '<div id="cf" style="font-family: Helvetica, Arial; font-size: 13px;"> <span class="cf-wrapper" style="box-sizing: border-box; position: fixed; bottom: 0; z-index: 5; width: 100%; border-top-width: 1px; border-top-color: #bfbfbf; border-top-style: solid; background-color: #eeeeee; text-align: center; line-height: 1.5; padding: 0.8em 1em 1em;"> <a data-href="campaign_url" class="cf-text" target="_blank" rel="nofollow noopener" style="box-shadow: none !important; color: inherit; text-decoration: none;"> <strong>New: DigitalOcean Marketplace</strong> <span>Deploy your favorite dev tools with 1-Click Apps</span> </a> <a href="https://codefund.app" data-target="powered_by_url" class="cf-powered-by" target="_blank" rel="nofollow noopener" style="box-shadow: none !important; font-size: 12px; text-decoration: none; color: #999;"> <em>ethical</em> ad by CodeFund <img data-src="impression_url"> </a> </span> </div> <style>#cf .cf-text:before { margin-right: 4px; padding: 2px 6px; border-radius: 3px; background-color: #4caf50; color: #fff; content: "Supporter"; } #cf .cf-powered-by::before { content: " "; color: rgba(0, 0, 0, 0.3); display: inline-block; } </style>';
      codeFundElement.querySelector('img[data-src="impression_url"]').src = 'https://codefund.io/display/f19dafba-cd20-4eef-b69f-5a19eff3ba05.gif?template=bottom-bar&theme=dark';
      codeFundElement.querySelectorAll('a[data-href="campaign_url"]').forEach(function (a) { a.href = 'https://codefund.io/impressions/f19dafba-cd20-4eef-b69f-5a19eff3ba05/click?campaign_id=237'; });

      var poweredByElement = codeFundElement.querySelector('a[data-target="powered_by_url"]');
      if (poweredByElement) { poweredByElement.href = 'https://codefund.io/invite/xp9Wa850yGY'; }

      var closeElement = codeFundElement.querySelector('button[data-behavior="close"]');
      if (closeElement) { closeElement.addEventListener('click', closeCodeFund); }

      evt.detail = { status: 'ok', house: false };
      detectUplift(1);
    } catch (e) {
      console.log('CodeFund detected an error! Please verify an element exists with id="codefund". ' + e.message);
      evt.detail = { status: 'error', message: e.message };
    }
    document.removeEventListener('DOMContentLoaded', embed);
    window.dispatchEvent(evt);
  };
  (document.readyState === 'loading') ? document.addEventListener('DOMContentLoaded', embed) : embed();
})();
