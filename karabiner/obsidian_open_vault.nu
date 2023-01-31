#!/Users/francischua/.cargo/bin/nu

let window = ('
  var seApp     = Application("System Events"); 
  var oProcess  = seApp.processes.whose({frontmost: true})[0]; 
  var appName   = oProcess.displayedName(); 
  oProcess.windows().find(w => w.attributes.byName("AXMain").value() === true).attributes.byName("AXTitle").value();
' | osascript -l JavaScript)

if ($window | str contains "Personal") {
  /usr/bin/open /Users/francischua/Obsidian/Stanford -a Obsidian
} else {
  /usr/bin/open /Users/francischua/Obsidian/Personal -a Obsidian
}

