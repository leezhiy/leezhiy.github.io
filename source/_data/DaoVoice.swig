{% if daovoice.enabled %}
  <script>
  (function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/0f81ff2f.js","daovoice")
  daovoice('init', {
    app_id: '{{daovoice.app_id}}',   // 必填，您的 APP 标识
  }, {
    launcher: {
      disableLauncherIcon: true, // 悬浮 ICON 是否显示
      defaultEnterView: 'list', // 'list' 或 'new' 默认是 list(在对话列表是空的时候默认切换到 new)
    }
  });
  daovoice('update');

  var DaoCloudIsShow = false;
  // 监听显示事件回调
  daovoice('onShow', function(){
    DaoCloudIsShow = ture;
  });
  // 监听隐藏事件回调
  daovoice('onHide', function(){
    DaoCloudIsShow = false;
  });
  // 点击按钮时运行的方法
  var openDaoCloud = function() {
    if( DaoCloudIsShow ) {
      daovoice('hide')
    } else {
      daovoice('show')
    }
  };
  </script>
{% endif %}


