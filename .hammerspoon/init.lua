hs.loadSpoon("AppLauncher")

spoon.AppLauncher:bindHotkeys(
   {
    c = "Calendar",
    b = "Google Chrome",
    n = "/Users/mannyschneck/.nix-profile/Applications/Emacs.app",
    m = "Emacs",
    z = "Zoom.us",
    t = "iTerm",
    l = "Microsoft Excel",
    j = "Firefox",
  }
)

function chrome_active_tab_with_name(name)
    return function()
        hs.osascript.javascript([[
            // below is javascript code
            var chrome = Application('Google Chrome');
            chrome.activate();
            var wins = chrome.windows;

            // loop tabs to find a web page with a title of <name>
            function main() {
                for (var i = 0; i < wins.length; i++) {
                    var win = wins.at(i);
                    var tabs = win.tabs;
                    for (var j = 0; j < tabs.length; j++) {
                    var tab = tabs.at(j);
                    tab.title(); j;
                    if (tab.title().indexOf(']] .. name .. [[') > -1) {
                            win.activeTabIndex = j + 1;
                            return;
                        }
                    }
                }
            }
            main();
            // end of javascript
        ]])
    end
end

hs.hotkey.bind({"alt"}, "H", chrome_active_tab_with_name("Google Cloud Platform"))

function focus_emacs()
	emacs_window = hs.window.find("doom emacs")
	emacs_window:focus()
end


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

hs.hotkey.bind({"ctrl,alt"}, "M", focus_emacs)
