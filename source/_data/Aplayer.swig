{% if aplayer.enabled %}
  <!-- require APlayer -->
  <link rel="stylesheet" href="{{aplayer.cdn.css}}">
  <script src="{{aplayer.cdn.js}}"></script>
  <!-- require MetingJS -->
  <script src="{{aplayer.cdn.meting}}"></script>
  <meting-js
    server="{{aplayer.server}}"
    type="{{aplayer.type}}"
    fixed="{{aplayer.fixed}}"
    id="{{aplayer.id}}"
    auto="{{aplayer.auto}}"
    mini="{{aplayer.mini}}"
    autoplay="{{aplayer.autoplay}}"
    theme="{{aplayer.theme}}"
    loop="{{aplayer.loop}}"
    order="{{aplayer.order}}"
    preload="{{aplayer.preload}}"
    volume="{{aplayer.volume}}"
    mutex="{{aplayer.mutex}}"
    list-folded="{{aplayer.listfolded}}"
    list-max-height="{{aplayer.listmaxheight}}"
    storage-name="{{aplayer.storagename}}" >
  </meting-js>
{% endif %}