var page;

page = new WebPage();

page.onConsoleMessage = function(msg) {
  var obj;
  if (/^PHANTOM:/.test(msg)) {
    console.log(msg);
    obj = JSON.parse(msg.substr(9));
    if (obj.name === 'done') phantom.exit(0);
  }
};

page.open("test/index.html", function(status) {
  if (status !== "success") {
    window.console.error("Could not open page");
    phantom.exit(1);
    return;
  }
  return page.evaluate(function() {
    return ['log', 'testStart', 'testDone', 'moduleStart', 'moduleDone', 'begin', 'done'].forEach(function(ev) {
      return window.QUnit[ev](function(res) {
        return window.phantomLog(ev, res);
      });
    });
  });
});

page.onInitialized = function() {
  return page.evaluate(function() {
    return window.phantomLog = function(name, result) {
      window.console.log("PHANTOM: " + (window.JSON.stringify({
        name: name,
        result: result
      })));
    };
  });
};

page.onError = function(msg, trace) {
  var obj;
  obj = {
    name: 'error',
    result: {
      msg: msg,
      trace: trace
    }
  };
  return console.error("PHANTOM: " + (JSON.stringify(obj)));
};
