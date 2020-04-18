hexo.extend.filter.register('theme_inject', function (injects) {
    if(hexo.theme.config.vendors.jquery) {
        // 引入 Jquery
        injects.head.raw('jquery.js', '<script src="' + hexo.theme.config.vendors.jquery + '"></script>', {}, {cache: true});
        // 引入 funnyTitle
        injects.head.file('funnyTitle', 'source/_data/FunnyTitle.swig');
    }
    // 引入 DaoVoice
    injects.head.file('daovoice', 'source/_data/DaoVoice.swig', {daovoice: hexo.theme.config.daovoice});
    // 引入 APlayer
    injects.head.file('aplayer', 'source/_data/APlayer.swig', {aplayer: hexo.theme.config.aplayer});
});

