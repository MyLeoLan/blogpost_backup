{% macro render(is_post) %}
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    <div class="sidebar-inner">

      {% set display_toc = is_post and theme.toc.enable %}

      {% if display_toc and toc(page.content).length > 1 %}
        <ul class="sidebar-nav motion-element">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap" >
            {{ __('sidebar.toc') }}
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {% endif %}

      <section class="site-overview sidebar-panel{% if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{% endif %}">
        <div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
          <img class="site-author-image" itemprop="image"
               src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}"
               alt="{{ theme.author }}" />
          <p class="site-author-name" itemprop="name">{{ theme.author }}</p>
          <p class="site-description motion-element" itemprop="description">{{ theme.description }}</p>
        </div>
        <nav class="site-state motion-element">
          <div class="site-state-item site-state-posts">
            <a href="{{ url_for(theme.menu.archives) }}">
              <span class="site-state-item-count">{{ site.posts.length }}</span>
              <span class="site-state-item-name">{{ __('state.posts') }}</span>
            </a>
          </div>

          {% if site.categories.length > 0 %}
            <div class="site-state-item site-state-categories">
              {% if theme.menu.categories %}<a href="{{ url_for(theme.menu.categories) }}">{% endif %}
                <span class="site-state-item-count">{{ site.categories.length }}</span>
                <span class="site-state-item-name">{{ __('state.categories') }}</span>
              {% if theme.menu.categories %}</a>{% endif %}
            </div>
          {% endif %}

          {% if site.tags.length > 0 %}
            <div class="site-state-item site-state-tags">
              {% if theme.menu.tags %}<a href="{{ url_for(theme.menu.tags) }}">{% endif %}
                <span class="site-state-item-count">{{ site.tags.length }}</span>
                <span class="site-state-item-name">{{ __('state.tags') }}</span>
              {% if theme.menu.tags %}</a>{% endif %}
            </div>
          {% endif %}

        </nav>

        {% if theme.rss %}
          <div class="feed-link motion-element">
            <a href="{{ url_for(theme.rss) }}" rel="alternate">
              <i class="fa fa-rss"></i>
              RSS
            </a>

<!-- 自定义High一下的功能 -->

 <a rel="alternate" class="mw-harlem_shake_slow wobble shake" href='javascript:(
   function go() {
   var songs = [
               "http://ofyfogrgx.bkt.clouddn.com/tongxingSibel%20-%20Im%20Sorry.mp3",
               "http://ofyfogrgx.bkt.clouddn.com/Music-sunburst.mp3",
               "http://ofyfogrgx.bkt.clouddn.com//blog/Apple%20&%20Stone%20-%20Lost.mp3"
   ];

   function c() {
       var e = document.createElement("link");
       e.setAttribute("type", "text/css");
       e.setAttribute("rel", "stylesheet");
       e.setAttribute("href", f);
       e.setAttribute("class", l);
       document.body.appendChild(e)
   }
   function h() {
       var e = document.getElementsByClassName(l);
       for (var t = 0; t < e.length; t++) {
           document.body.removeChild(e[t])
       }
   }
   function p() {
       var e = document.createElement("div");
       e.setAttribute("class", a);
       document.body.appendChild(e);
       setTimeout(function() {
           document.body.removeChild(e)
       }, 100)
   }
   function d(e) {
       return {
           height : e.offsetHeight,
           width : e.offsetWidth
       }
   }
   function v(i) {
       var s = d(i);
       return s.height > e && s.height < n && s.width > t && s.width < r
   }
   function m(e) {
       var t = e;
       var n = 0;
       while (!!t) {
           n += t.offsetTop;
           t = t.offsetParent
       }
       return n
   }
   function g() {
       var e = document.documentElement;
       if (!!window.innerWidth) {
           return window.innerHeight
       } else if (e && !isNaN(e.clientHeight)) {
           return e.clientHeight
       }
       return 0
   }
   function y() {
       if (window.pageYOffset) {
           return window.pageYOffset
       }
       return Math.max(document.documentElement.scrollTop, document.body.scrollTop)
   }
   function E(e) {
       var t = m(e);
       return t >= w && t <= b + w
   }
   function S() {
       var e = document.getElementById("audio_element_id");
       if(e != null){
           var index = parseInt(e.getAttribute("curSongIndex"));
           if(index > songs.length - 2) {
               index = 0;
           } else {
               index++;
           }
           e.setAttribute("curSongIndex", index);
           N();
       }
       e.src = i;
       e.play()
   }
   function x(e) {
       e.className += " " + s + " " + o
   }
   function T(e) {
       e.className += " " + s + " " + u[Math.floor(Math.random() * u.length)]
   }
   function N() {
       var e = document.getElementsByClassName(s);
       var t = new RegExp("\\b" + s + "\\b");
       for (var n = 0; n < e.length; ) {
           e[n].className = e[n].className.replace(t, "")
       }
   }
   function initAudioEle() {
       var e = document.getElementById("audio_element_id");
       if(e === null){
           e = document.createElement("audio");
           e.setAttribute("class", l);
           e.setAttribute("curSongIndex", 0);
           e.id = "audio_element_id";
           e.loop = false;
           e.bgcolor = 0;
           e.addEventListener("canplay", function() {
           setTimeout(function() {
               x(k)
           }, 500);
           setTimeout(function() {
               N();
               p();
               for (var e = 0; e < O.length; e++) {
                   T(O[e])
               }
           }, 15500)
       }, true);
       e.addEventListener("ended", function() {
           N();
           h();
           go();
       }, true);
       e.innerHTML = " <p>If you are reading this, it is because your browser does not support the audio element. We recommend that you get a new browser.</p> <p>";
       document.body.appendChild(e);
       }
   }
   
   initAudioEle();
   var e = 30;
   var t = 30;
   var n = 350;
   var r = 350;
   var curSongIndex = parseInt(document.getElementById("audio_element_id").getAttribute("curSongIndex"));
   var i = songs[curSongIndex];
   
   var s = "mw-harlem_shake_me";
   var o = "im_first";
   var u = ["im_drunk", "im_baked", "im_trippin", "im_blown"];
   var a = "mw-strobe_light";
   var f = "//7xncbk.com1.z0.glb.clouddn.com/harlem-shake-style.css";
   /* harlem-shake-style.css，替换成你的位置，也可以直接使用：//s3.amazonaws.com/moovweb-marketing/playground/harlem-shake-style.css
   //7xncbk.com1.z0.glb.clouddn.com/harlem-shake-style.css  七牛云地址
   var f = "/css/harlem_shake_style.css"; */
   

   var l = "mw_added_css";
   var b = g();
   var w = y();
   var C = document.getElementsByTagName("*");
   var k = null;
   for (var L = 0; L < C.length; L++) {
       var A = C[L];
       if (v(A)) {
           if (E(A)) {
               k = A;
               break
           }
       }
   }
   if (A === null) {
       console.warn("Could not find a node of the right size. Please try a different page.");
       return
   }
   c();
   S();
   var O = [];
   for (var L = 0; L < C.length; L++) {
       var A = C[L];
       if (v(A)) {
           O.push(A)
       }
   }
   })()'><i class="menu-item-icon fa fa-music fa-fw"></i>High</a>
</div>
         <!-- end High一下 -->

        {% endif %}  


        <div class="links-of-author motion-element">
          {% if theme.social %}
            {% for name, link in theme.social %}
              <span class="links-of-author-item">
                <a href="{{ link }}" target="_blank" title="{{ name }}">
                  {% if theme.social_icons.enable %}
                    <i class="fa fa-fw fa-{{ theme.social_icons[name] | default('globe') | lower }}"></i>
                  {% endif %}
                  {{ name }}
                </a>
              </span>
            {% endfor %}
          {% endif %}
        </div>

        {% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}
        {% if theme.creative_commons in cc %}
          <div class="cc-license motion-element" itemprop="license">
            <a href="https://creativecommons.org/{% if theme.creative_commons === 'zero' %}publicdomain/zero/1.0{% else %}licenses/{{ theme.creative_commons }}/4.0{% endif %}/" class="cc-opacity" target="_blank" rel="external nofollow">
              <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />
            </a>
          </div>
        {% endif %}

        {# Blogroll #}
        {% if theme.links %}
          <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.links_layout | default('inline') }}">
            <div class="links-of-blogroll-title">
              <i class="fa  fa-fw fa-{{ theme.links_icon | default('globe') | lower }}"></i>
              {{ theme.links_title }}
            </div>
            <ul class="links-of-blogroll-list">
              {% for name, link in theme.links %}
                <li class="links-of-blogroll-item">
                  <a href="{{ link }}" title="{{ name }}" target="_blank" rel="external nofollow">{{ name }}</a>
                </li>
              {% endfor %}
            </ul>
          </div>
        {% endif %}

        {% include '../_custom/sidebar.swig' %}

      </section>

      {% if display_toc and toc(page.content).length > 1 %}
      <!--noindex-->
        <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">

            {% if page.toc_number === undefined %}
              {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
            {% else %}
              {% set toc = toc(page.content, { "class": "nav", list_number: page.toc_number }) %}
            {% endif %}

            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}

          </div>
        </section>
      <!--/noindex-->
      {% endif %}

    </div>
  </aside>
{% endmacro %}
