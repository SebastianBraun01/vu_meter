package require cmdline
package require ::quartus::project


# ----------------------------------------------------------------------------
# Definiere CLI Parameter
# ----------------------------------------------------------------------------
set parameters {
    {projectname.arg ""   "Project Name"}
}
array set arg [::cmdline::getoptions argv $parameters]

set requiredParameters {projectname}
foreach parameter $requiredParameters {
    if {$arg($parameter) == ""} {
        puts stderr "Missing required parameter: -$parameter"
        exit 1
    }
}


# ----------------------------------------------------------------------------
# Prüfe, ob Projekt existiert
# ----------------------------------------------------------------------------
if { ![project_exists $arg(projectname)] } {
    post_message -type error "Project $arg(projectname) does not exist"
    exit
}


# ----------------------------------------------------------------------------
# Projekt öffnen
# ----------------------------------------------------------------------------
project_open $arg(projectname)


# ----------------------------------------------------------------------------
# Starte design flow
# ----------------------------------------------------------------------------
load_package flow
execute_flow -compile


# ----------------------------------------------------------------------------
# Erstelle Reports
# ----------------------------------------------------------------------------
load_package report
load_report $arg(projectname)
write_report_panel -file flowsummary.log "Flow Summary"


# ----------------------------------------------------------------------------
# Einstellungen speichern und Projekt schließen
# ----------------------------------------------------------------------------
project_close
