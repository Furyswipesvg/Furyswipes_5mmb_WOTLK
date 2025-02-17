set version 062220b
lappend auto_path twapi
lappend auto_path aabacus
package require twapi_input
package require aabacus
set kb [string tolower [twapi::get_keyboard_layout_name]]
set game [format "%s" [aabacus::getwowversion]]
puts ""
puts "Welcome to multiboxing, sucka!"
puts ""
puts "USING 5MMB.TCL VERSION $version"
puts "WOW VERSION DETECTED IS $game"
puts "=============================================="
puts "My keyboard layout is $kb"
set display [twapi::get_display_size]
array unset toons
array unset autodelete
array unset levelingparty
set winswapkeys "NumpadEnd NumpadDown NumpadPgDn NumpadLeft Clear"
set dontsoulstone ""
set extrawait1 1000
set extrawait2 0
set hideframes ""
set meleeiwt false
set different5mans false
set sendwwithiwt false
set huntermeleeonfollow false
set dontflashframe ""
#set game "bfa"
set dontsetcamera "false"
set dontsetleadercamera "false"
set useautotrade ""
set dontautodelete ""
set dontbuystacks ""
set dontautopass ""
set autoturn ""
set nomacros ""
set clearcastmissiles ""
set warlockpet ""
set healhellfireat ""
set healtankat ""
set healchumpat ""
set healselfat ""
set maxheal "11 11 11 11"
set clique_overlay "1 1 1 1"
set raidname "myraid1"
set oemkey ""
set gazefollow ""
set burningfollow ""
set dedicated_healers ""
set powerleveler ""
set monitor ""
set use2monitors false
set openlevelers ""
set shiftlevelers ""
set ctrllevelers ""
set goldto ""
set boeto ""
set hunterlabels ""
set meleelabels ""
set healerlabels ""
set manalabels ""
set altchars(�) {\195\128}
set altchars(�) {\195\129}
set altchars(�) {\195\130}
set altchars(�) {\195\131}
set altchars(�) {\195\132}
set altchars(�) {\195\133}
set altchars(�) {\195\134}
set altchars(�) {\195\135}
set altchars(�) {\195\136}
set altchars(�) {\195\137}
set altchars(�) {\195\138}
set altchars(�) {\195\139}
set altchars(�) {\195\140}
set altchars(�) {\195\141}
set altchars(�) {\195\142}
set altchars(�) {\195\143}
set altchars(�) {\195\144}
set altchars(�) {\195\145}
set altchars(�) {\195\146}
set altchars(�) {\195\147}
set altchars(�) {\195\148}
set altchars(�) {\195\149}
set altchars(�) {\195\150}
set altchars(�) {\195\151}
set altchars(�) {\195\152}
set altchars(�) {\195\153}
set altchars(�) {\195\154}
set altchars(�) {\195\155}
set altchars(�) {\195\156}
set altchars(�) {\195\157}
set altchars(�) {\195\158}
set altchars(�) {\195\159}
set altchars(�) {\195\160}
set altchars(�) {\195\161}
set altchars(�) {\195\162}
set altchars(�) {\195\163}
set altchars(�) {\195\164}
set altchars(�) {\195\165}
set altchars(�) {\195\166}
set altchars(�) {\195\167}
set altchars(�) {\195\168}
set altchars(�) {\195\169}
set altchars(�) {\195\170}
set altchars(�) {\195\171}
set altchars(�) {\195\172}
set altchars(�) {\195\173}
set altchars(�) {\195\174}
set altchars(�) {\195\175}
set altchars(�) {\195\176}
set altchars(�) {\195\177}
set altchars(�) {\195\178}
set altchars(�) {\195\179}
set altchars(�) {\195\180}
set altchars(�) {\195\181}
set altchars(�) {\195\182}
set altchars(�) {\195\183}
set altchars(�) {\195\184}
set altchars(�) {\195\185}
set altchars(�) {\195\186}
set altchars(�) {\195\187}
set altchars(�) {\195\188}
set altchars(�) {\195\189}
set altchars(�) {\195\190}
set altchars(�) {\195\191}
set aname "�o�o"
proc add_follow labels { 
	upvar toons toons hK hK
	if { $labels!="" } {
		set totallabels 0
		set idx 0
		for { set i 0 } { $i<[array size toons] } { incr i } {
	  	set toonname [string tolower [lindex $toons($i) 3]]
	  	set account [lindex $toons($i) 1]
	  	set raids [lrange $toons($i) 5 end]
			set comps 1
			foreach myraid $raids {
				regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
				if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
			}
	  	set length [string length $account]
			foreach mycomp $comps {
	  		if { $length > 2 } {
	    		set length [string length $account]
	    		set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  		} else {
	    		set acctnick ${account}
	  		}
	  		set acct_winname($account) ${acctnick}
	  		puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
			puts $hK "\t<SendLabel ${labels}>"
			puts $hK "\t<Key shift f[expr 8+$idx]>"
			incr totallabels
		}
		}
	puts $hK "\t<endif>"
	}
}
proc add_assist {} {
	upvar toons toons hK hK winlabels winlabels
	set totallabels 0
	set idx 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  if { $i>9 } { break }
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  	if { $length > 2 } {
	    	set length [string length $account]
	    	set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  	} else {
	    	set acctnick ${account}
	  	}
	  	set acct_winname($account) ${acctnick}
	  	puts $hK "\t<if MouseIsOverWindow ${toonname}_${mycomp}${acctnick}>"
		puts $hK "\t<SendLabel $winlabels>"
		if {$totallabels==5} { set idx 0 }
		if {$totallabels > 4} {
			puts $hK "\t<Key shift f[expr 8+$idx]>"
		} else {
			puts $hK "\t<Key ctrl f[expr 8+$idx]>"
		}
		incr totallabels
		incr idx
		}
	}
	puts $hK "\t<endif>"
}
proc altname { name } {
	upvar altchars altchars
	set newname ""
	foreach letter [split $name ""] {
		if { [lsearch [array names altchars] $letter ] > -1  } {
			set newname $newname$altchars($letter)
		} else {
			set newname $newname$letter
		}
	}
	return $newname
}
array set kb_oem "00020409 oem3"
array set kb_oem "0000040f oem5"
array set kb_oem "00000406 oem5"
array set kb_oem "00000809 oem8"
array set kb_oem "0000080a oem5"
array set kb_oem "00000407 oem5"
array set kb_oem "00000409 oem3"
array set kb_oem "0000040a oem5"
array set kb_oem "0000040c oem7"
array set kb_oem "00000410 oem5"
array set kb_oem "00000414 oem5"
array set kb_oem "0000041d oem5"
array set kb_oem "00000809 oem7"
array set kb_oem "00000813 oem7"
array set kb_oem "00010407 oem5"
array set kb_oem "00000816 oem5"
array set kb_oem "0000041a oem3"
array set kb_oem "00000804 oem3"
set SME "Interface\\Addons\\Furyswipes_5mmb\\Furyswipes_5mmb.lua"
#set SME SM_Extend.lua
set fail false
set toonlistf [lindex $argv 0]
if { $toonlistf == "" } { set toonlistf toonlist.txt } 
if { ! [file exist $toonlistf ] } {
	puts "ERROR: YOU MUST HAVE A FILE NAMED $toonlistf IN THIS DIRECTORY"
	puts ""
	puts "FORMAT OF FILE:"
	puts "# <-this is a comment. It is ignored by the program"
	puts "You need to specify your multibox accounts with 5 words starting with box"
	puts "box <accountname> <password> <toon name> <role>"
	puts "Role can be tank / melee/ caster / hunter /healer"
	puts "EVERY TOON must have a role"
	puts "Windows for the toons will come out on the screen in the order you list them."
	puts "Tanks will get bigger windows, if possible"
	return
}
set nohotkeyoverwrite false
set nosmoverwrite false
if { $fail } { puts "hit any key to return" ; gets stdin char ; return }
set tL [open $toonlistf r]
if { [set tL [open $toonlistf r]] != "" } {
  puts "Found toonlist $toonlistf"
} else {
  puts "ERROR: Could not open $toonlistf in read mode."
}
#if { [file exist $HKN] } {
#  puts "DO YOU WANT TO OVERWRITE $HKN ?"
#  puts "You should back this file up first."
#  puts "ARE YOU SURE YOU WANT TO OVERWRITE $HKN? y/n"
#  gets stdin char
#  if { $char!="Y" && $char!="y" } {
#    puts "File won't be changed."
#    set nohotkeyoverwrite true
#    puts "hit enter to continue" ; gets stdin char
#  }
#}
#if { [file exist $SME] } {
#  puts "DO YOU WANT TO OVERWRITE $SME ?"
#  puts "You should back this file up first."
#  puts "ARE YOU SURE YOU WANT TO OVERWRITE $SME? y/n"
#  gets stdin char
#  if { $char!="Y" && $char!="y" } {
#    puts "File won't be changed."
#	set nosmoverwrite true
#    puts "hit enter to contineue" ; gets stdin char
#  }
#}
set numtoons 0
while { [gets $tL line] >= 0 } {
  set line [regsub "\n" $line "" ]
  if { $line == "" } { continue }
  set line [string trim $line] 
  if { [string index $line 0] != "#" } {
    if { [string tolower [lindex $line 0]] == "box" } {
      if { [llength $line] < 6 } { puts "ERROR: box takes 5 or 6 arguments in toonlist line $line" ; puts "hit any key to return" ; gets stdin char ; return }
      set bnet_account [lindex $line 1] 
      set passwd [lindex $line 2] 
      set license [lindex $line 3]
      set name [lindex $line 4] 
      set role [lindex $line 5] 
      set raidletters [string tolower [lrange $line 6 end]]
      set raids ""
      foreach userraid $raidletters { 
        regexp {([a-z]|)([0-9])?} $userraid match userraid cpunum
        if { $cpunum=="" } { set cpunum 1 } 
        lappend raids ${userraid}${cpunum}     
      }
      if { ! [regexp m $raids]  } { lappend raids m1 }
      set toons($numtoons) "$bnet_account $license $passwd $name $role $raids"
      incr numtoons
    } elseif { [string tolower [lindex $line 0]] == "keyboard" } {
     if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
     set keyboard [lindex $line 1] 
     if { $keyboard !="us" && $keyboard !="uk" && $keyboard !="de" && $keyboard !="other" }  { puts "ERROR: keyboard choices are us/uk/de/other" ; return }
     if { $keyboard=="de" } {
       set oem "oem5"
     } elseif { $keyboard=="other" } {
       set oem "oem7"
     } elseif { $keyboard=="uk" } {
       set oem "oem8"
     } else {
       set oem "oem3"
     }
   } elseif { [string tolower [lindex $line 0]] == "monitor" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set monitor [lindex $line 1] 
				if { $monitor !="1280x1024" && $monitor !="1920x1080" && $monitor !="2560x1440" && $monitor !="3360x1440" && $monitor !="3840x2160" }  { puts "ERROR: monitor choices are 1280x1024/1920x1080/2560x1440/3360x1440/3840x2160" ; return }
    } elseif { [string tolower [lindex $line 0]] == "computer" } {
 		  	if { [llength $line] != 3 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set computer([lindex $line 1]) [lindex $line 2]
    } elseif { [string tolower [lindex $line 0]] == "raidname" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set raidname [lindex $line 1]
				    } elseif { [string tolower [lindex $line 0]] == "extrawait1" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set extrawait1 [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "extrawait2" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set extrawait2 [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "oemkey" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set oemkey [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "powerleveler" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set powerleveler [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "bombfollow" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set bombfollow [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "gazefollow" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set gazefollow [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "burningfollow" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set burningfollow [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "dedicated_healers" } {
 		  	if { [expr ([llength $line]-1) % 2] } { puts "ERROR: must be sequence of paired tank and healer $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dedicated_healers [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "goldto" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if { [llength [lindex $line 1]] > 1 } { puts "ERROR: arg must be one name $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set goldto [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "boeto" } {
 		  	if { [llength $line]  < 2 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set boeto [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "itemto" } {
 		  	if { [llength $line] < 3 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set itemto([lindex $line 1]) [lrange $line 2 end]
    } elseif { [string tolower [lindex $line 0]] == "maxheal" } {
 		  	if { [llength $line] != 5 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set maxheal [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "clique_overlay" } {
 		  	if { [llength $line] != 5 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set clique_overlay [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "dontautodelete" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontautodelete true
    } elseif { [string tolower [lindex $line 0]] == "dontsoulstone" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontsoulstone true
    } elseif { [string tolower [lindex $line 0]] == "hideframes" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set hideframes true
    } elseif { [string tolower [lindex $line 0]] == "meleeiwt" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set meleeiwt true
    } elseif { [string tolower [lindex $line 0]] == "sendwwithiwt" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set sendwwithiwt true
  } elseif { [string tolower [lindex $line 0]] == "huntermeleeonfollow" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set huntermeleeonfollow true
    } elseif { [string tolower [lindex $line 0]] == "different5mans" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set different5mans true
    } elseif { [string tolower [lindex $line 0]] == "bfa" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set game bfa
    } elseif { [string tolower [lindex $line 0]] == "retail" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set game bfa
    } elseif { [string tolower [lindex $line 0]] == "classic" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set game classic
    } elseif { [string tolower [lindex $line 0]] == "tbc" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set game tbc
    } elseif { [string tolower [lindex $line 0]] == "wotlk" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set game wotlk
    } elseif { [string tolower [lindex $line 0]] == "vanilla" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set game vanilla
    } elseif { [string tolower [lindex $line 0]] == "dontflashframe" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontflashframe "true"
    } elseif { [string tolower [lindex $line 0]] == "dontsetcamera" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set setcamera "true"
    } elseif { [string tolower [lindex $line 0]] == "dontseteleadercamera" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontseteleadercamera true
    } elseif { [string tolower [lindex $line 0]] == "use2monitors" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set use2monitors true
    } elseif { [string tolower [lindex $line 0]] == "useautotrade" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set useautotrade true
    } elseif { [string tolower [lindex $line 0]] == "dontbuystacks" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontbuystacks true
    } elseif { [string tolower [lindex $line 0]] == "dontautopass" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set dontautopass true
    } elseif { [string tolower [lindex $line 0]] == "autoturn" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set autoturn true
    } elseif { [string tolower [lindex $line 0]] == "nomacros" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set nomacros true
    } elseif { [string tolower [lindex $line 0]] == "clearcastmissiles" } {
 		  	if { [llength $line] != 1 } { puts "ERROR: should be only one element on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set clearcastmissiles true
    } elseif { [string tolower [lindex $line 0]] == "warlockpet" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set warlockpet [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healhellfireat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healhellfireat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healtankat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healtankat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healchumpat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healchumpat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healchumpat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healchumpat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "healselfat" } {
 		  	if { [llength $line] != 2 } { puts "ERROR: should be only two elements on line $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set healselfat [lindex $line 1]
    } elseif { [string tolower [lindex $line 0]] == "autodelete" } {
 		  	if { [llength $line] < 3 } { puts "ERROR: incorrect number of elements line $line" ; puts "hit any key to return" ; gets stdin char ; return }
 		  	if {  [expr ([llength $line ]-1) % 2] } { puts "ERROR: must be even number of elements after command $line" ; puts "hit any key to return" ; gets stdin char ; return }
				foreach {item stack} [lrange $line 1 end] {
					set autodelete($item) $stack
				}
    } elseif { [string tolower [lindex $line 0]] == "levelingparty" } {
 		  	if { [llength $line] < 2 || [llength $line] > 6  } { puts "ERROR: incorrect number of elements line $line. Must be between one and 5 toon names" ; puts "hit any key to return" ; gets stdin char ; return }
	      set sql [string totitle [ string tolower [lindex $line 1]]]
				set sqmem [lrange $line 2 end]
				set levelingparties($sql) $sqmem
    } elseif { [string tolower [lindex $line 0]] == "raidorder10" } {
 		  	if { [llength [lindex $line 1]] >11 } { puts "ERROR: second arg must 10 or less names $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set index [expr [array size raidorder10] + 1]
				set raidorder10($index) [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "raidorder20" } {
 		  	if { [llength [lindex $line 1]] >21 } { puts "ERROR: second arg must 20 or less names $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set index [expr [array size raidorder20] + 1]
				set raidorder20($index) [lrange $line 1 end]
    } elseif { [string tolower [lindex $line 0]] == "raidorder40" } {
 		  	if { [llength [lindex $line 1]] >41 } { puts "ERROR: second arg must 40 or less names $line" ; puts "hit any key to return" ; gets stdin char ; return }
				set index [expr [array size raidorder40] + 1]
				set raidorder40($index) [lrange $line 1 end]
    }
  }
}
if { ! [info exists computer(1) ] } { set computer(1) Local }
if $numtoons==0 { 
  puts "ERROR: No box commands with toon names were found in $toonlistf. "
  puts "SEE toonlist_command_reference.txt"
  puts "hit any key to return" ; gets stdin char ; return
}
set tooncount $numtoons
close $tL 
if {$game=="classic" } { set wowexe "WowClassic.exe" } else { set wowexe "Wow.exe" } 
if { ! [file exist "$wowexe" ] } {
	puts "ERROR: THIS PROGRAM MUST BE THE DIRECTORY WHERE YOUR $wowexe resides"
	return
}
if {$game=="tbc" || $game=="vanilla" } { set meleeiwt false }
if { $oemkey != "" } { 
	set oem $oemkey
} else {
	if { [info exists kb_oem($kb)] } {
		set oem $kb_oem($kb)
	} else {
		set oem oem5
		puts "WARNING: I COULD NOT FIND YOUR KEYBOARD. ASSIGNING MOUSECLICK SHARING TO OEM5" 
		puts "NOTIFY Furyswipes on discord."
		puts "NEXT STEP: Turn on Last Key Press panel on hotkeynet and click the key to the left of 1. What is it called? oem3? oem5?"
		puts "Put this in your toonlist:"
		puts "oemkey oem5"
		puts "(or whichever it is)"
		puts "and drag-n-drop again"
	}
}
puts "Detected display size $display"
if { $monitor != "" } { 
	puts "Automatic monitor selection overridden by user to $monitor"
} else {
	set sizes "1280x1024 1920x1080 2560x1440 3360x1440 3840x2160"
	foreach size $sizes {
		regexp "(\\d+)" $size match x
		regexp "x(\\d+)" $size match y
		if { [lindex $display 0] >= $x && [lindex $display 1] >= $y } {
			set monitor $size
		}
	}
	if { $monitor == "" } {
	  puts "****************************************"
	  puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	  puts "WARNING: Supported monitor size not found. Check that windows scaling is 100%!"
	  puts "If you have some terrible small monitor, the best I can do is 1280x1024."
	  set monitor "1280x1024"
  	} else {
	  puts "Monitor automatically set to $monitor"
  	}
}
#while { $tooncount >= 1 } {
  #incr tooncount -1
  #puts $toons($tooncount)
  #set account [lindex $toons($tooncount) 0]
  #puts "Account $account has license [lindex $toons($tooncount) 1]"
  #puts "Account $account has password [lindex $toons($tooncount) 2]"
  #set name [string tolower [lindex $toons($tooncount) 3]]
  #set name [string totitle $name ]
  #puts "Account $account has toon name $name"
  #puts "Account $account has role [ string tolower [lindex $toons($tooncount) 4]]"
  #puts "Account $account has raids [lrange $toons($tooncount) 5 end]"
#}
set HKN 5mmb_HKN_${game}.txt
if { ! $nohotkeyoverwrite } {
	set hK [open $HKN w+]
	puts $hK "// Version $version"
	puts $hK {// Comments begin with //. They don't do anything in the script.
<SetActiveWindowTrackingDelay 175>
<SetActiveWindowTracking on>

// These are window labels. Kind of like nicknames for long window names.
}
	set totallabels 0
	for { set i 0 } { $i<[array size toons] } { incr i } {
	  set toonname [string tolower [lindex $toons($i) 3]]
	  set account [lindex $toons($i) 1]
	  set role [string tolower [lindex $toons($i) 4]]
	  set raids [lrange $toons($i) 5 end]
		set comps 1
		foreach myraid $raids {
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			if { [lsearch $comps $cpunum] == -1 } { lappend comps $cpunum } 
		}
	  set length [string length $account]
		foreach mycomp $comps {
	  	if { $length > 2 } {
	    	set length [string length $account]
	    	set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	  	} else {
	    	set acctnick ${account}
	  	}
	  	set acct_winname($account) ${acctnick}
		#puts "acct_winname for $account is $acct_winname($account)"
		if { $role=="melee" } { 
			if { $meleelabels=="" } { 
				set meleelabels "w${totallabels}"
			} else {
				set meleelabels "$meleelabels,w${totallabels}"
			}
		}
		if { $role=="hunter" } { 
			if { $hunterlabels=="" } { 
				set hunterlabels "w${totallabels}"
			} else {
				set hunterlabels "$hunterlabels,w${totallabels}"
			}
		}
		if { $role=="healer" } { 
			if { $healerlabels=="" } { 
				set healerlabels "w${totallabels}"
			} else {
				set healerlabels "$healerlabels,w${totallabels}"
			}
		}
		if { $role=="healer" || $role=="caster" } { 
			if { $manalabels=="" } { 
				set manalabels "w${totallabels}"
			} else {
				set manalabels "$manalabels,w${totallabels}"
			}
		}
	  	puts $hK "  <Label w${totallabels} $computer($mycomp) SendWinM ${toonname}_${mycomp}${acctnick}>"
			incr totallabels
		}
	}
	puts $hK ""
	puts $hK {// The above labels are your window names.
// Short names are easier to work with.
// So in this case, w0 will be used later to point to Mootalia's window.
// Name your windows something that gives you a hint.
// Toon name and a hint at the end about what wow license to click
// It's not critical, but it's very helpful

<Command RenameWoW>}
	set curdir [pwd]
  puts $hK "  <Run \"$curdir/tclkitsh-win32.upx.exe\" \"renwowwin.tcl %1%\">"
  puts $hK {    <WaitForWin %1% 10000>

// This is the main launcher command definition.
<Command LaunchAndRename>
	<SendPC %1%>}
	puts -nonewline $hK {	<Run "}
	puts $hK "$curdir/$wowexe\" >"
	puts $hK "	<Wait $extrawait1>"
	puts $hK {	<RenameWoW %2%>
	<SetWinSize %5% %6%>
	<SetWinPos %7% %8%>
	<TargetWin %2%>}
	puts $hK "	<Wait $extrawait2>"
	puts $hK {	<SetForegroundWin>
	<Text %3%>
	<Key Tab>
	<Text %4%>
	<Key Enter>}
if { $hideframes=="true" } {
	puts $hK "\t<RemoveWinFrame>"
	puts $hK "\t<TargetWin %2%>"
	puts $hK "\t<WaitForInputIdle 2000>"
	puts $hK "\t<SetFramelessWinSizeWithSimulatedMouse %5% %6% 0>"
}
	puts $hK "\t<TargetWin %2%>"
	puts $hK "\t<WaitForInputIdle 2000>"
puts $hK {
// This is the second Launcher command definition
// It's not used. You CAN use it as a special wow setup for your main.
// You know, max graphics, sound, etc.
// NEXT STEP: If you want to do this, you have to make a SEPERATE WOW
// DIR and put the path below. Set that wow up the way you want.
<Command LaunchHiresAndRename>
	<SendPC %1%>}
	puts -nonewline $hK {	<Run "}
	puts $hK "C:/hirezwow/$wowexe\" >"
	puts $hK "	<Wait $extrawait1>"
	puts $hK {	<RenameWoW %2%>
	<SetWinSize %5% %6%>
	<SetWinPos %7% %8%>
	<TargetWin %2%>}
	puts $hK "	<Wait $extrawait2>"
	puts $hK {	<SetForegroundWin>
	<Text %3%>
	<Key Tab>
	<Text %4%>
	<Key Enter>}
if { $hideframes=="true" } {
	puts $hK "\t<RemoveWinFrame>"
	puts $hK "\t<TargetWin %2%>"
	puts $hK "\t<WaitForInputIdle 2000>"
	puts $hK "\t<SetFramelessWinSizeWithSimulatedMouse %5% %6% 0>"
}
	puts $hK {	<TargetWin %2%>
	<WaitForInputIdle 2000>

// This command is used to resize your window.	
<Command ResetWindowPosition>
	<SendPC %1%> 
	<TargetWin %2%>
	<SetForegroundWin>
	<SetWinRegion none>
	<SetWinSize %5% %6%>
	<SetWinPos %7% %8%>

// This is your first HOTKEY. That's a key combo that only works when scroll_lock is on.
// In this case that combo is Alt-Ctrl-m (case doesn't matter)
// It launches your wow windows!
// The numbers at the end are the window size (x and y) and the window position (x and y)
// Experiment with them if you like.
// OPTIONAL STEP: If you want to run a special wow setup for your main, 
// change the command LaunchAndRename to LaunchHiresAndRename just for your main.

}

#THESE ARE WINDOW CONFIGURATIONS
#Each is a list of 4-number sets. 
#The numbers are win-size-x win-size-y win-position-x win-position-y
#There are a lot of lists. It's a 3d array.
#Main list is every window for that number of monitiors e.g. (5)
#Second list set is each combo of monitors with one window as main. (numpad keys)
#Third list is each monitor position in the set
# Right now, 3d only fully used (window switching) for raidhash(5) one monitor.
# 20 Window Raid 
if { $clique_overlay=="" } {
	switch $monitor {
	1280x1024 { set clique_overlay "33 84 21 106" }
	1920x1080 { set clique_overlay "53 130 32 165" }
	2560x1440 { set clique_overlay "67 172 46 219" }
	3360x1440 { set clique_overlay "98 236 61 304" }
	3840x2160 { set clique_overlay "105 260 65 330" }
	}
}
if { $monitor == "3840x2160" } {
#3840x2160
if { $use2monitors } {
	set raidhash(1) {{3840 2160 0 0 }}
	set raidhash(2) {{3840 2160 0 0 } {3840 2160 3840 0 }}
	set raidhash(3) {{3840 2160 0 0 } {1920 1080 3840 0 } {1920 1080 3840 1080}}
	set raidhash(4) {{3840 2160 0 0 } {1920 1080 3840 0 } {1920 1080 5760 0 } {1920 1080 3840 1080}}
	set raidhash(5) {{1920 1440 960 720} {960 720 0 720} {960 720 960 0} {960 720 1920 0} {960 720 2880 720}}
	set raidhash(10) {{1280 1020 0 960} {1280 1020 1280 960} {1280 1020 2560 960} {640 480 640 0} {640 480 0 0} {640 480 0 480} {640 480 1280 0} {640 480 640 480} {640 480 1280 480} {640 480 1920 480}}
	set raidhash(20) {{640 480 0 0} {960 720 0 1440} {960 720 960 1440} {960 720 1920 1440} {640 480 640 0} {640 480 1280 0} {640 480 1920 0} {640 480 2560 0} {640 480 3200 0} {640 480 0 480} {640 480 640 480} {640 480 1280 480} {640 480 1920 480} {640 480 2560 480} {640 480 3200 480} {640 480 0 960} {640 480 640 960} {640 480 1280 960} {640 480 1920 960 } {640 480 2560 960}} 
	set raidhash(25) {{533 430 1548 0} {1548 1290 0 860} {533 430 1548 430} {533 430 1548 860} {533 430 1548 1290} {533 430 1548 1720} {533 430 2081 0} {533 430 2081 430} {533 430 2081 860} {533 430 2081 1290} {533 430 2081 1720} {533 430 2614 0} {533 430 2614 430} {533 430 2614 860} {533 430 2614 1290} {533 430 2614 1720} {533 430 3147 0} {533 430 3147 430} {533 430 3147 860} {533 430 3147 1290} {533 430 3147 1720} {533 430 482 0} {533 430 1015 0} {533 430 482 430} {533 430 1015 430}}
	set raidhash(40) {{480 360 0 0} {1440 1080 960 1080} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800}}
} else { 
	set raidhash(1) {{3840 2160 0 0 }}
	set raidhash(2) {{2560 1440 0 720} {1280 720 0 0} {1280 720 1280 0} {1280 720 2560 0} {1280 720 2560 720}}
	set raidhash(3) {{2560 1440 0 720} {1280 720 0 0} {1280 720 1280 0} {1280 720 2560 0} {1280 720 2560 720}}
	set raidhash(4) {{2560 1440 0 720} {1280 720 0 0} {1280 720 1280 0} {1280 720 2560 0} {1280 720 2560 720}}
			if { ! $different5mans } {
				set raidhash(5) {{2560 1440 0 720} {1280 720 0 0} {1280 720 1280 0} {1280 720 2560 0} {1280 720 2560 720}}
			} else {
				if { $game=="bfa" } {
					set raidhash(5) {{1138 640 0 880} {782 440 0 0} {782 440 0 440} {782 440 782 0} {782 440 782 440}}
				} elseif { $game=="classic" } {
					set raidhash(5) {{1138 640 0 1520} {782 440 1564 0} {782 440 1564 440} {782 440 2346 0} {782 440 2346 440}}
				} elseif { $game=="wotlk" } {
					set raidhash(5) {{1138 640 1138 880} {782 440 3128 0} {782 440 3128 440} {782 440 3128 880} {782 440 3128 880}}
				} elseif { $game=="tbc" } {
					set raidhash(5) {{1138 640 1138 1520} {782 440 2276 880} {782 440 2276 1320} {782 440 2279 1760} {782 440 3058 1760}}
				}
			}
	set raidhash(10) {{1280 1020 1280 960} {1280 1020 0 960} {1280 1020 2560 960} {640 480 0 480} {640 480 640 480} {640 480 1280 480} {640 480 1920 480} {640 480 0 0} {640 480 640 0} {640 480 1280 0}}
	set raidhash(10) {{1920 1080 0 1080} {960 540 0 540} {960 540 960 540} {960 540 0 0} {960 540 960 0} {1920 1080 1920 1080} { 960 540 1920 540} {960 540 2880 540} {960 540 1920 0} {960 540 2880 0}}
	set raidhash(10) {{1920 1080 0 1080} {1920 1080 1920 1080} {960 540 0 540} {960 540 960 540} {960 540 0 0} {960 540 960 0} {960 540 1920 540} {960 540 2880 540} {960 540 1920 0} {960 540 2880 0}}
	if { ! $different5mans } { 
		set raidhash(20) {{640 480 0 0} {960 720 0 1440} {960 720 960 1440} {960 720 1920 1440} {640 480 640 0} {640 480 1280 0} {640 480 1920 0} {640 480 2560 0} {640 480 3200 0} {640 480 0 480} {640 480 640 480} {640 480 1280 480} {640 480 1920 480} {640 480 2560 480} {640 480 3200 480} {640 480 0 960} {640 480 640 960} {640 480 1280 960} {640 480 1920 960 } {640 480 2560 960}} 
	} else {
		set raidhash(20) {{1138 640 0 880} {782 440 0 0} {782 440 0 440} {782 440 782 0} {782 440 782 440} {1138 640 0 1520} {782 440 1564 0} {782 440 1564 440} {782 440 2346 0} {782 440 2346 440} {1138 640 1138 880} {782 440 3128 0} {782 440 3128 440} {782 440 3128 880} {782 440 3128 880} {1138 640 1138 1520} {782 440 2276 880} {782 440 2276 1320} {782 440 2279 1760} {782 440 3058 1760}}
	}
	set raidhash(25) {{533 430 1548 0} {1548 1290 0 860} {533 430 1548 430} {533 430 1548 860} {533 430 1548 1290} {533 430 1548 1720} {533 430 2081 0} {533 430 2081 430} {533 430 2081 860} {533 430 2081 1290} {533 430 2081 1720} {533 430 2614 0} {533 430 2614 430} {533 430 2614 860} {533 430 2614 1290} {533 430 2614 1720} {533 430 3147 0} {533 430 3147 430} {533 430 3147 860} {533 430 3147 1290} {533 430 3147 1720} {533 430 482 0} {533 430 1015 0} {533 430 482 430} {533 430 1015 430}}
	set raidhash(40) {{480 360 0 0} {1440 1080 960 1080} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800}}
	set raidhash(80) {{480 360 0 0} {1440 1080 960 1080} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800} {480 360 0 0} {1440 1080 960 1080} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 0 360} {480 360 480 360} {480 360 960 360} {480 360 1440 360} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 0 720} {480 360 480 720} {480 360 960 720} {480 360 1440 720} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720} {480 360 0 1080} {480 360 480 1080} {480 360 2400 1080} {480 360 2880 1080} {480 360 3360 1080} {480 360 0 1440} {480 360 480 1440} {480 360 2400 1440} {480 360 2880 1440} {480 360 3360 1440} {480 360 0 1800} {480 360 480 1800} {480 360 2400 1800} {480 360 2880 1800} {480 360 3360 1800}}
		}
	} elseif { $monitor == "3360x1440" } {
	  #3360x1440
		if { $use2monitors } {
			set raidhash(1) {{3360 1440 0 0 }}
			set raidhash(2) {{3360 1440 0 0 } {3360 1440 3360 0 }}
			set raidhash(3) {{3360 1440 0 0 } {1280 720 3360 0 } {1280 720 3360 720}}
			set raidhash(4) {{3360 1440 0 0 } {1280 720 3360 0 } {1280 720 3360 720 } {1280 720 4640 0}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2580 0} {860 720 2580 720}}
     	set raidhash(10) {{2064 960 688 0} {688 480 0 0} {688 480 0 480} {688 480 0 960} {688 480 688 960} {688 480 1376 960} {688 480 2064 960} {688 480 2752 0} {688 480 2752 480} {688 480 2752 960}}
     	set raidhash(15) {{1440 1200 720 0} {720 600 0 0} {720 600 0 600} {720 600 2160 0} {720 600 2160 600} {480 400 2880 0} {480 400 2880 400} {480 400 2880 800} {480 400 3360 0} {480 400 3360 400} {480 400 3360 800} {480 400 3840 0} {480 400 3840 400} {480 400 3840 800} {480 400 4320 0}}
      			set raidhash(20) {{490 360 0 0} {490 360 0 360} {490 360 0 720} {490 360 0 1080} {490 360 490 0} {490 360 490 360} {490 360 490 720} {490 360 490 1080} {980 720 980 0} {490 360 980 1080} {490 360 1470 720} {490 360 1470 1080} {490 360 1960 0} {490 360 1960 720} {490 360 1960 1080} {490 360 2450 0} {490 360 2450 360} {490 360 2450 720} {490 360 2450 1080} {490 360 980 720}}
		} else { 
			set raidhash(1) {{3360 1440 0 0 }}
 			set raidhash(2) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2580 0} {860 720 2580 720}}
 			set raidhash(3) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2580 0} {860 720 2580 720}}
 			set raidhash(4) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2580 0} {860 720 2580 720}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2580 0} {860 720 2580 720}}
     	set raidhash(10) {{2064 960 688 0} {688 480 0 0} {688 480 0 480} {688 480 0 960} {688 480 688 960} {688 480 1376 960} {688 480 2064 960} {688 480 2752 0} {688 480 2752 480} {688 480 2752 960}}
     	set raidhash(15) {{1440 1200 720 0} {720 600 0 0} {720 600 0 600} {720 600 2160 0} {720 600 2160 600} {480 400 2880 0} {480 400 2880 400} {480 400 2880 800} {480 400 3360 0} {480 400 3360 400} {480 400 3360 800} {480 400 3840 0} {480 400 3840 400} {480 400 3840 800} {480 400 4320 0}}
     	set raidhash(20) {{490 360 0 0} {490 360 0 360} {490 360 0 720} {490 360 0 1080} {490 360 490 0} {490 360 490 360} {490 360 490 720} {490 360 490 1080} {980 720 980 0} {490 360 980 1080} {490 360 1470 720} {490 360 1470 1080} {490 360 1960 0} {490 360 1960 720} {490 360 1960 1080} {490 360 2450 0} {490 360 2450 360} {490 360 2450 720} {490 360 2450 1080} {490 360 980 720}}
		}
	} elseif { $monitor == "2560x1440" } {
	  #x1440
		if { $use2monitors } { 
			set raidhash(1) {{2560 1440 0 0 }}
			set raidhash(2) {{2560 1440 0 0 } {2560 1440 2560 0 }}
			set raidhash(3) {{2560 1440 0 0 } {1280 720 2560 0 } {1260 720 2560 720}}
			set raidhash(4) {{2560 1440 0 0 } {1280 720 2560 0 } {1280 720 2560 720 } {1280 720 3360 0}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2560 0} {860 720 2560 720}}
 			set raidhash(5) {{1720 1440 860 0} {860 720 0 0} {860 720 0 720} {860 720 2560 0} {860 720 2560 720}}
     	set raidhash(10) {{2064 960 688 0} {688 480 0 0} {688 480 0 480} {688 480 0 960} {688 480 688 960} {688 480 1376 960} {688 480 2064 960} {688 480 2752 0} {688 480 2752 480} {688 480 2752 960}}
     	set raidhash(15) {{1440 1200 720 0} {720 600 0 0} {720 600 0 600} {720 600 2160 0} {720 600 2160 600} {480 400 2880 0} {480 400 2880 400} {480 400 2880 800} {480 400 3360 0} {480 400 3360 400} {480 400 3360 800} {480 400 3840 0} {480 400 3840 400} {480 400 3840 800} {480 400 4320 0}}
      			set raidhash(20) {{490 360 0 0} {490 360 0 360} {490 360 0 720} {490 360 0 1080} {490 360 490 0} {490 360 490 360} {490 360 490 720} {490 360 490 1080} {980 720 980 0} {490 360 980 1080} {490 360 1470 720} {490 360 1470 1080} {490 360 1960 0} {490 360 1960 720} {490 360 1960 1080} {490 360 2450 0} {490 360 2450 360} {490 360 2450 720} {490 360 2450 1080} {490 360 980 720}}
		} else { 
			set raidhash(1) {{2560 1440 0 0 }}
	set raidhash(2) {{1280 960 640 480} {640 480 0 480} {640 480 640 0} {640 480 1280 0} {640 480 1920 480}}
	set raidhash(3) {{1280 960 640 480} {640 480 0 480} {640 480 640 0} {640 480 1280 0} {640 480 1920 480}}
	set raidhash(4) {{1280 960 640 480} {640 480 0 480} {640 480 640 0} {640 480 1280 0} {640 480 1920 480}}
	set raidhash(5) {{1280 960 640 480} {640 480 0 480} {640 480 640 0} {640 480 1280 0} {640 480 1920 480}}
     	set raidhash(10) {{2064 960 688 0} {688 480 0 0} {688 480 0 480} {688 480 0 960} {688 480 688 960} {688 480 1376 960} {688 480 2064 960} {688 480 2752 0} {688 480 2752 480} {688 480 2752 960}}
     	set raidhash(15) {{1440 1200 720 0} {720 600 0 0} {720 600 0 600} {720 600 2160 0} {720 600 2160 600} {480 400 2880 0} {480 400 2880 400} {480 400 2880 800} {480 400 3360 0} {480 400 3360 400} {480 400 3360 800} {480 400 3840 0} {480 400 3840 400} {480 400 3840 800} {480 400 4320 0}}
     	set raidhash(20) {{490 360 0 0} {490 360 0 360} {490 360 0 720} {490 360 0 1080} {490 360 490 0} {490 360 490 360} {490 360 490 720} {490 360 490 1080} {980 720 980 0} {490 360 980 1080} {490 360 1470 720} {490 360 1470 1080} {490 360 1960 0} {490 360 1960 720} {490 360 1960 1080} {490 360 2450 0} {490 360 2450 360} {490 360 2450 720} {490 360 2450 1080} {490 360 980 720}}
		}
	} elseif { $monitor == "1280x1024" } {
			set raidhash(1) {{1280 1024 0 0 }}
			set raidhash(2) {{640 480 320 240} {320 240 0 240} {320 240 320 0} {320 240 640 0} {320 240 960 240}}
			set raidhash(3) {{640 480 320 240} {320 240 0 240} {320 240 320 0} {320 240 640 0} {320 240 960 240}}
			set raidhash(4) {{640 480 320 240} {320 240 0 240} {320 240 320 0} {320 240 640 0} {320 240 960 240}}
			set raidhash(5) {{640 480 320 240} {320 240 0 240} {320 240 320 0} {320 240 640 0} {320 240 960 240}}
	} else {
	  #1080p
		if { $use2monitors } {
	set raidhash(1) {{1920 1080 0 0 }}
						set raidhash(2) {{1920 1080 0 0} {960 540 1920 540} {960 540 1920 0} {960 540 2880 0} {960 540 2880 540}}
						set raidhash(3) {{1920 1080 0 0} {960 540 1920 540} {960 540 1920 0} {960 540 2880 0} {960 540 2880 540}}
						set raidhash(4) {{1920 1080 0 0} {960 540 1920 540} {960 540 1920 0} {960 540 2880 0} {960 540 2880 540}}
						set raidhash(5) {{1920 1080 0 0} {960 540 1920 540} {960 540 1920 0} {960 540 2880 0} {960 540 2880 540}}
			set raidhash(10) {{1920 1080 0 0} {640 360 1920 0} {640 360 2560 0} {640 360 3200 0} {640 360 1920 360} {640 360 2560 360} {640 360 3200 360} {640 360 1920 720} {640 360 2560 720} {640 360 3200 720}}
	  	set raidhash(20) {{960 720 0 360} {480 360 0 0} {480 360 480 0} {480 360 960 0} {480 360 1440 0} {480 360 960 360} {480 360 1440 360} {480 360 960 720} {480 360 1920 0} {480 360 2400 0} {480 360 2880 0} {480 360 3360 0} {480 360 1920 360} {480 360 2400 360} {480 360 2880 360} {480 360 3360 360} {480 360 1920 720} {480 360 2400 720} {480 360 2880 720} {480 360 3360 720}}
	  	set raidhash(25) {{320 240 320 0} {480 360 0 480} {680 480 360 480} {320 240 0 0} {320 240 640 0} {320 240 960 0} {320 240 1280 0} {320 240 1600 0} {320 240 0 240} {320 240 320 240} {320 240 640 240} {320 240 960 240} {320 240 960 480} {320 240 1600 240} {320 240 1280 240} {320 240 1280 480} {320 240  1600 480} {320 240 960 720} {320 240 1280 720} {320 240 1600 720}}
	  	set raidhash(25) {{533 430 1548 0} {1548 1290 0 860} {533 430 1548 430} {533 430 1548 860} {533 430 1548 1290} {533 430 1548 1720} {533 430 2081 0} {533 430 2081 430} {533 430 2081 860} {533 430 2081 1290} {533 430 2081 1720} {533 430 2614 0} {533 430 2614 430} {533 430 2614 860} {533 430 2614 1290} {533 430 2614 1720} {533 430 3147 0} {533 430 3147 430} {533 430 3147 860} {533 430 3147 1290} {533 430 3147 1720} {533 430 482 0} {533 430 1015 0} {533 430 482 430} {533 430 1015 430}}
	  	set raidhash(25) {{266 215 774 0} {774 645 0 430} {266 215 774 215} {266 215 774 430} {266 215 774 645} {266 215 774 860} {266 215 1040 0} {266 215 1040 215} {266 215 1040 430} {266 215 1040 645} {266 215 1040 860} {266 215 1307 0} {266 215 1307 215} {266 215 1307 430} {266 215 1307 645} {266 215 1307 860} {266 215 1573 0} {266 215 1573 215} {266 215 1573 430} {266 215 1573 645} {266 215 1573 860} {266 215 241 0} {266 215 507 0} {266 215 241 215} {266 215 507 215}}
		set raidhash(40) {{240 180 0 0} {480 360 480 720} {480 360 0 720} {480 360 960 720} {480 360 1440 720} {240 180 120 0} {240 180 240 0} {240 180 360 0} {240 180 480 0} {240 180 600 0} {240 180 720 0} {240 180 840 0} {240 180 960 0} {240 180 1200 0} {240 180 1440 0} {240 180 1680 0} {240 180 0 180} {240 180 240 180} {240 180 480 180} {240 180 720 180} {240 180 960 180} {240 180 1200 180} {240 180 1440 180} {240 180 1680 180} {240 180 0 360} {240 180 240 360} {240 180 480 360} {240 180 720 360} {240 180 960 360} {240 180 1200 360} {240 180 1440 360} {240 180 1680 360} {240 180 0 540} {240 180 240 540} {240 180 480 540} {240 180 720 540} {240 180 960 540} {240 180 1200 540} {240 180 1440 540} {240 180 1680 540}}
		} else { 
	set raidhash(1) {{1920 1080 0 0 }}
	set raidhash(2) {{960 540 0 540 } {960 540 0 0}}
	set raidhash(3) {{960 540 0 540 } {960 540 0 0 } {960 540 960 0}}
	set raidhash(4) {{960 540 0 540 } {960 540 0 0 } {960 540 960 0} {960 540 960 540}}
	set raidhash(5) {{960 720 480 360} {480 360 0 360} {480 360 480 0} {480 360 960 0} {480 360 1440 360}}
	set raidhash(5) {{1280 720 0 360} {640 360 0 0} {640 360 640 0} {640 360 1280 0} {640 360 1280 360}}
			set raidhash(10) {{640 510 0 480} {640 510 640 480} {640 510 1280 480} {320 240 320 0} {320 240 0 0} {320 240
	 	0 240} {320 240 640 0} {320 240 320 240} {320 240 640 240} {320 240 960 240}}
	  	set raidhash(20) {{320 240 320 0} {480 360 0 480} {680 480 360 480} {320 240 0 0} {320 240 640 0} {320 240 960 0} {320 240 1280 0} {320 240 1600 0} {320 240 0 240} {320 240 320 240} {320 240 640 240} {320 240 960 240} {320 240 960 480} {320 240 1600 240} {320 240 1280 240} {320 240 1280 480} {320 240  1600 480} {320 240 960 720} {320 240 1280 720} {320 240 1600 720}}
	  	set raidhash(25) {{266 215 774 0} {774 645 0 430} {266 215 774 215} {266 215 774 430} {266 215 774 645} {266 215 774 860} {266 215 1040 0} {266 215 1040 215} {266 215 1040 430} {266 215 1040 645} {266 215 1040 860} {266 215 1307 0} {266 215 1307 215} {266 215 1307 430} {266 215 1307 645} {266 215 1307 860} {266 215 1573 0} {266 215 1573 215} {266 215 1573 430} {266 215 1573 645} {266 215 1573 860} {266 215 241 0} {266 215 507 0} {266 215 241 215} {266 215 507 215}}
			set raidhash(40) {{240 180 0 0} {480 360 480 720} {480 360 0 720} {480 360 960 720} {480 360 1440 720} {240 180 120 0} {240 180 240 0} {240 180 360 0} {240 180 480 0} {240 180 600 0} {240 180 720 0} {240 180 840 0} {240 180 960 0} {240 180 1200 0} {240 180 1440 0} {240 180 1680 0} {240 180 0 180} {240 180 240 180} {240 180 480 180} {240 180 720 180} {240 180 960 180} {240 180 1200 180} {240 180 1440 180} {240 180 1680 180} {240 180 0 360} {240 180 240 360} {240 180 480 360} {240 180 720 360} {240 180 960 360} {240 180 1200 360} {240 180 1440 360} {240 180 1680 360} {240 180 0 540} {240 180 240 540} {240 180 480 540} {240 180 720 540} {240 180 960 540} {240 180 1200 540} {240 180 1440 540} {240 180 1680 540}}
		}
	}
	array unset raidlist
	array unset raididx
	set raids ""
	for {set i 0} {$i < [array size toons]} {incr i} {
		#puts [lrange $toons($i) 5 end]
		foreach letter [lrange $toons($i) 5 end] {
			#puts "[lindex $toons($i) 0] [lindex $toons($i) 1] has raidletter $letter"
			if {[lsearch $raids $letter]== -1} {
			  set raids "$raids $letter"
			}
		}
	}
	set mainraids ""
	foreach userraid $raids { 
		regexp {([a-z]|[A-Z])([0-9])?} $userraid match userraid cpunum
		set raididx($userraid) 0
		array unset group${userraid}
		if { [lsearch $mainraids $userraid ] == -1 } { lappend mainraids $userraid } 
	}
	for {set i 0} {$i < [array size toons]} {incr i} {
		set myraids [lrange $toons($i) 5 end]
		foreach userraid $myraids {
			regexp {([a-z]|[A-Z])([0-9])?} $userraid match userraid cpunum
			set group${userraid}($raididx($userraid)) "[lrange $toons($i) 0 4] ${userraid}${cpunum}"
			#puts "group $userraid"
			#puts "[lrange $toons($i) 0 4] ${userraid}${cpunum}"
			#puts "$groupm(0)"
			#puts "raidindex of group $userraid $raididx($userraid)"
			#puts [array names groupf]
			#puts [array get groupf 1]
			incr raididx($userraid)
		}
	}
	array unset windowcount
	for {set i 0} {$i < [array size toons]} {incr i} {
		set myraids [lrange $toons($i) 5 end]
	  foreach  userraid $myraids {
			if [info exists windowcount($userraid)] {
				incr windowcount($userraid)
			} else {
				set  windowcount($userraid) 1
			}
		}
	}
	foreach raid [array names windowcount] { 
	  #Set window count in each raid to something I actually have a hash for
		if {$windowcount($raid) > 25} { set windowcount($raid) 40
		} elseif {$windowcount($raid) > 20 } { set windowcount($raid) 25  
		} elseif {$windowcount($raid) > 10 } { set windowcount($raid) 20  
		} elseif {$windowcount($raid) > 5 } { set windowcount($raid) 10  
		} 
		set windex($raid) 0
	}
	#foreach mainraid $mainraids {
		#puts $hK ""
		#set arrayname group${mainraid}
		#if { [array size $arrayname] == 2 } { 
			#set thistoon [lindex [array get $arrayname 0] 1]
	  		#set toonname [string tolower [lindex $thistoon 3]]
	  		#set myraid [lindex $thistoon 5]
			#regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		#set bnet_account [lindex $thistoon 0]
	  		#set account [lindex $thistoon 1]
	  		#set passwd [lindex $thistoon 2]
	  		#set winname1 ${toonname}_${cpunum}$acct_winname($account)
			#set thistoon [lindex [array get $arrayname 1] 1]
	  		#set toonname [string tolower [lindex $thistoon 3]]
	  		#set myraid [lindex $thistoon 5]
			#regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		#set bnet_account [lindex $thistoon 0]
	  		#set account [lindex $thistoon 1]
	  		#set passwd [lindex $thistoon 2]
	  		#set winname2 ${toonname}_${cpunum}$acct_winname($account)
			#puts $hK "<Command RemoveFrames>"
			#puts $hK "\t<TargetWin $winname1>"
			#puts $hK "\t<RemoveWinFrame>"
			#puts $hK "\t<RenameWin World $winname1>"
			#puts $hK "\t<TargetWin $winname2>"
			#puts $hK "\t<RemoveWinFrame>"
			#puts $hK "\t<RenameWin World $winname2>"
			#puts $hK ""
		#}
	#}
	foreach mainraid $mainraids {
		puts $hK ""
		puts $hK "<Hotkey ScrollLockOn Alt Ctrl $mainraid>"
		#puts "mainraid is $mainraid"
		set arrayname group${mainraid}
		#puts "arrayname is $arrayname"
		#puts "array size is [array size $arrayname]"
		#for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			#puts "Array $arrayname $i contains [array get $arrayname $i]"
		#}
		for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			set thistoon [lindex [array get $arrayname $i] 1]
			#puts "thistoon is $thistoon"
	  		set toonname [string tolower [lindex $thistoon 3]]
			#puts "toonname is $toonname"
	  		set myraid [lindex $thistoon 5]
			#puts "myraid is $myraid"
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
			#puts "cpunum is $cpunum"
	  		set bnet_account [lindex $thistoon 0]
			#puts "bnet_account is [lindex $thistoon 0]"
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
			#puts "passwd is $passwd"
	  		#puts "winname is ${toonname}_${cpunum}$acct_winname($account)"
	  		set winname ${toonname}_${cpunum}$acct_winname($account)
	  		puts $hK "  <if WinDoesNotExist $winname>"
	  		puts $hK "  <LaunchAndRename $computer($cpunum) $winname $bnet_account $passwd [lindex $raidhash($windowcount($myraid)) $windex($myraid)] $toonname>"
			incr windex($myraid)
		}
		foreach raid [array names windowcount] { 
			set windex($raid) 0
		}
		#if { [array size $arrayname]==2 } { 
			#puts $hK "\t<RemoveFrames>"
		#}
		puts $hK ""
		puts $hK "<Hotkey ScrollLockOn Shift Ctrl $mainraid>"
		for { set i 0 } { $i<[array size $arrayname] } { incr i } {
			set thistoon [lindex [array get $arrayname $i] 1]
	  	set toonname [string tolower [lindex $thistoon 3]]
	  	set myraid [lindex $thistoon 5]
		regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  	set account [lindex $thistoon 1]
	  	set passwd [lindex $thistoon 2]
	  	set winname ${toonname}_${cpunum}$acct_winname($account)
	  	puts $hK "  <ResetWindowPosition $computer($cpunum) $winname $bnet_account $passwd  [lindex $raidhash($windowcount($myraid)) $windex($myraid)]>"
			incr windex($myraid)
		}
	}
	set pip_limit 0
	foreach mainraid $mainraids {
		puts $hK ""
		set arrayname group${mainraid}
		if { [array size $arrayname] == 2 && $pip_limit==0 } { 
			set pip_limit 1
			set thistoon [lindex [array get $arrayname 0] 1]
	  		set toonname [string tolower [lindex $thistoon 3]]
	  		set myraid [lindex $thistoon 5]
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		set bnet_account [lindex $thistoon 0]
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
	  		set winname1 ${toonname}_${cpunum}$acct_winname($account)
			set thistoon [lindex [array get $arrayname 1] 1]
	  		set toonname [string tolower [lindex $thistoon 3]]
	  		set myraid [lindex $thistoon 5]
			regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  		set bnet_account [lindex $thistoon 0]
	  		set account [lindex $thistoon 1]
	  		set passwd [lindex $thistoon 2]
	  		set winname2 ${toonname}_${cpunum}$acct_winname($account)
			puts $hK "<Command RemoveFrames>"
			puts $hK "\t<TargetWin $winname1>"
			puts $hK "\t<RemoveWinFrame>"
			puts $hK "\t<RenameWin World $winname1>"
			puts $hK "\t<TargetWin $winname2>"
			puts $hK "\t<RemoveWinFrame>"
			puts $hK "\t<RenameWin World $winname2>"
			puts $hK ""
			puts $hK "<Command SetPip>"
			puts $hK "\t<TargetWin %2%>"
			puts $hK "\t\t<SetWinSize [expr int([lindex $raidhash(1) 0 0]/4)] [expr int([lindex $raidhash(1) 0 1]/4)]>"
			puts $hK "\t\t<SetWinPos [expr int([lindex $raidhash(1) 0 0]*.7)] [expr int([lindex $raidhash(1) 0 1]*.6)]>"
			puts $hK "\t<TargetWin %1%>"
			puts $hK "\t\t<SetWinPos 0 0>"
			puts $hK "\t\t<SetWinSize [lindex $raidhash(1) 0 0] [lindex $raidhash(1) 0 1]>"
			puts $hK "\t<TargetWin %2%>"
			puts $hK "\t\t<SetForegroundWin>"
			puts $hK "\t\t<UpdateWin>"
			puts $hK "\t<TargetWin %1%>"
			puts $hK "\t\t<SetWinRegion [expr int([lindex $raidhash(1) 0 0]*.7)] [expr int([lindex $raidhash(1) 0 1]*.6)] [expr int([lindex $raidhash(1) 0 0]/4)] [expr int([lindex $raidhash(1) 0 1]/4)]>"
			puts $hK "\t\t<SetForegroundWin>"
			puts $hK ""
			puts $hK "<Hotkey ScrollLockOn F11>"
			puts $hK "\t<Toggle>"
			puts $hK "\t\t<SetPip $winname1 $winname2>"
			puts $hK "\t<Toggle>"
			puts $hK "\t\t<SetPip $winname2 $winname1>"
			puts $hK ""
		}
	}
	foreach mainraid $mainraids {
		#Win swapping only happens for main raid m
		#puts "mainraid is $mainraid"
		set arrayname group${mainraid}
		regexp {([a-z]|[A-Z])([0-9])?} $mainraid match raidletter cpunum
		if { $raidletter ne "m" } { continue } 
		for  { set x 0 } { $x<[array size $arrayname] } { incr x} {
			if { $x > 4 } { break } 
			puts $hK "<Hotkey ScrollLockOn [lindex $winswapkeys $x]>"
			puts $hK "<SaveMousePos>"
			foreach raid [array names windowcount] { 
				set windex($raid) 0
			}
			for { set i 0 } { $i<[array size $arrayname] } { incr i } {
				if { $i > 4 } { break } 
				set thistoon [lindex [array get $arrayname $i] 1]
	  			set toonname [string tolower [lindex $thistoon 3]]
	  			set myraid [lindex $thistoon 5]
				regexp {([a-z]|[A-Z])([0-9])?} $myraid match foo cpunum
	  			set bnet_account [lindex $thistoon 0]
	  			set account [lindex $thistoon 1]
	  			set passwd [lindex $thistoon 2]
	  			set winname ${toonname}_${cpunum}$acct_winname($account)
				set winset  $raidhash($windowcount($myraid))
				set win0 [list [lindex $winset 0 ]]
				set win1 [list [lindex $winset 1 ]]
				set win2 [list [lindex $winset 2 ]]
				set win3 [list [lindex $winset 3 ]]
				set win4 [list [lindex $winset 4 ]]
				set swaplist [list \
					"$win0 $win1 $win2 $win3 $win4" \
					"$win1 $win0 $win2 $win3 $win4" \
					"$win2 $win1 $win0 $win3 $win4" \
					"$win3 $win1 $win2 $win0 $win4" \
					"$win4 $win1 $win2 $win3 $win0" \
					]
	  			puts $hK "<ResetWindowPosition $computer($cpunum) $winname null null [lindex $swaplist $x $windex($myraid) ]>"
				incr windex($myraid)
			}
			puts $hK "<RestoreMousePos>"
		}
	}
				#set f [open WTF\\config.wtf w]
#puts $f {SET agentUID "wow"
#SET useUiScale "1"}
#close $f
	set winlabels ""
	for { set i 0 } { $i<$totallabels } { incr i } {
	  if { $winlabels=="" } { set winlabels  "$winlabels w${i}" } else { set winlabels "${winlabels},w${i}" } 
	}
	puts $hK "" 
	puts $hK {<Hotkey ScrollLockOn Numpad1>
	<DoHotKey Hotkey ScrollLockOn NumpadEnd>
<Hotkey ScrollLockOn Numpad2>
	<DoHotKey Hotkey ScrollLockOn NumpadDown>
<Hotkey ScrollLockOn Numpad3>
	<DoHotKey Hotkey ScrollLockOn NumpadPgDn>
<Hotkey ScrollLockOn Numpad4>
	<DoHotKey Hotkey ScrollLockOn NumpadLeft>
<Hotkey ScrollLockOn Numpad5>
	<DoHotkey Hotkey ScrollLockOn Clear>}
	puts $hK ""
	puts $hK {// This is the hotkey that closes all windows-- Ctrl-Alt-o (letter O)	}
	puts $hK "<Hotkey ScrollLockOn Alt Ctrl o>"
	puts $hK "<SendLabel $winlabels>"
	puts $hK {  <CloseWin>
	}
	puts $hK "" 
	puts $hK {// This is a special hotkey I made for reloading all your user interfaces in wow.}
	puts $hK {// Ctrl-L (case never matters) will enter /reload into each window}
	puts $hK "<Hotkey ScrollLockOn Ctrl l>"
	puts $hK "<SendLabel $winlabels>"
	puts $hK {  <Key enter>
	  <Wait 250>
	  <Key divide>
	  <Wait 25>
	  <Text reload>
	  <Wait 175>
	  <Key enter>
	}
	puts $hK {// This is the true magic...this runs /init in each window to set up bindings and macros!
// Ctrl-i}
	puts $hK "<Hotkey ScrollLockOn Ctrl i>"
	puts $hK "<SendLabel $winlabels>"
	puts $hK {  <Key enter>
	  <Wait 250>
	  <Key divide>
	  <Wait 25>
	  <Text init>
	  <Wait 175>
	  <Key enter>
	}
	puts $hK {//-----------------------------------------------------------
// This is the key you hold down to send mouse clicks to all windows.
// I use ~ (the key to the left of the 1 key)
// That key is oem5 in Germany and oem8 in UK. If none of those work, you may be oem7.
//-----------------------------------------------------------}
	puts $hK "<UseKeyAsModifier $oem>"
	puts $hK "<Hotkey ScrollLockOn $oem LButton, RButton, Button4, Button5>"
	puts $hK {      <SaveMousePos>}
	puts $hK {      <Wait 5>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {      <ClickMouse %TriggerMainKey%>}
	puts $hK {      <Wait 5>}
	puts $hK {      <RestoreMousePos>}
	puts $hK ""
	#puts $hK "<CreateColoredButton clique $clique_overlay 0x101010 0x101010>"
	puts -nonewline $hK {<Hotkey ScrollLockOn LButton, MButton, RButton, Button4, Button5>
	<Passthrough>
	<If MouseIsOverWindowRect }
	set toonname [string tolower [lindex $toons(0) 3]]
	set account [lindex $toons(0) 1]
	set length [string length $account]
	if { $length > 2 } {
		set length [string length $account]
		set acctnick "[string index $account 0][string index $account [expr $length-2]][string index $account [expr $length-1]]"
	} else {
		set acctnick ${account}
	}
	puts -nonewline $hK "${toonname}_1${acctnick}"
	puts $hK " $clique_overlay >"
	set allbutmain [regsub "w0," $winlabels ""] 
      puts $hK {	<SaveMousePos>
	<Wait 5>}
	puts $hK "\t<SendLabel ${allbutmain}>"
	puts $hK {	<ClickMouse Scale %Trigger%>
	<Wait 5>
	<RestoreMousePos>}
	puts $hK ""
	puts $hK {//-----------------------------------------------------------
// This is the catch-all hotkey definition. Every key here
// will be sent to both windows. Any key NOT HERE will NOT.
// Notice there is an exception list at the end.
// The word %Trigger% gets replaced with whatever key you clicked.
//-----------------------------------------------------------
<Hotkey ScrollLockOn A-Z, 1-9, Shift, Ctrl, Alt, Plus, Minus, Esc , Divide, F1-F12 except F11,1-6,E,F,Q,H, W, A, S, D, R, T, Y, I, U, J, V>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK { <Key %Trigger%>}
	puts $hK ""
	puts $hK {//-----------------------------------------------------------
// THIS KEY IS DIFFERENT. THESE are MOVEMENT key definitions.
// This is different from a Hotkey. Hotkeys only work once, the instant
// You press them. Movement keys can be held down, and they work
// constantly.
// Notice, asdw, the normal wow keys aren't here. You don't want your normal
// wow movement keys to move your side  toons.
// Use the arrow keys for that. (see, they are there)
//-----------------------------------------------------------
	<MovementHotkey ScrollLockOn space, left, right,e,q>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<Key %Trigger%>"
	puts $hK ""
	if { $game!="bfa" } { 
	puts $hK {//You can even make special movement keys for just some of your toons.}
	puts $hK {//Hunter goes into ranged mode on down arrow, melee mode on uparrow too}
	puts $hK {<Hotkey ScrollLockOn down>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<KeyDown Down>"
	if {$hunterlabels!=""} { 
		puts $hK "\t<Sendlabel ${hunterlabels}>"
		puts $hK "\t<Key Shift 9>"
	}
	puts $hK {<HotkeyUp ScrollLockOn down>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<KeyUp Down>"
	puts $hK ""
	puts $hK {<Hotkey ScrollLockOn up>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<KeyDown Up>"
	if {$hunterlabels!=""} { 
		puts $hK "\t<Sendlabel ${hunterlabels}>"
		puts $hK "\t<Key Shift 0>"
	}
	puts $hK {<HotkeyUp ScrollLockOn up>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<KeyUp Up>"
	puts $hK ""
        } else { 	
	puts $hK {<MovementHotkey ScrollLockOn down>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<Key Down>"
	puts $hK ""
	puts $hK {<MovementHotkey ScrollLockOn up>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<Key Up>"
	puts $hK ""
	}
	if {$hunterlabels!=""} { 
		puts $hK {//Hunter backup}
		puts $hK {<MovementHotkey ScrollLockOn T>}
		puts $hK "\t<Sendlabel ${hunterlabels}>"
		puts $hK "\t<Key Down>"
		if { $game!="bfa" } { puts $hK "\t<Key Shift 9>" } 
		puts $hK ""
	}
	if {$meleelabels!="" || $hunterlabels!=""} { 
		puts $hK {//Melee/Hunter forward}
		puts $hK {<MovementHotkey ScrollLockOn R>}
	if {$hunterlabels!=""} { 
		puts $hK "\t<Sendlabel ${hunterlabels}>"
		puts $hK "\t<Key Up>"
		if { $game!="bfa" } { puts $hK "\t<Key Shift 0>" } 
	}
	if {$meleelabels!=""} { 
		puts $hK "\t<Sendlabel ${meleelabels}>"
		puts $hK "\t<Key Up>"
		puts $hK ""
	}
	}
	if {$meleelabels!=""} {
		puts $hK {//Melee backup}
		puts $hK {<MovementHotkey ScrollLockOn V>}
		puts $hK "\t<Sendlabel ${meleelabels}>"
		puts $hK "\t<Key Down>"
		puts $hK ""
	}
	if {$healerlabels!=""} {
		puts $hK {//Healer backup}
		puts $hK {<MovementHotkey ScrollLockOn Y>}
		puts $hK "\t<Sendlabel ${healerlabels}>"
		puts $hK "\t<Key Down>"
		puts $hK ""
	}
	if {$manalabels!=""} {
		puts $hK {//Mana backup}
		puts $hK {<MovementHotkey ScrollLockOn H>}
		puts $hK "\t<Sendlabel ${manalabels}>"
		puts $hK "\t<Key Down>"
		puts $hK ""
	}
puts $hK {//-------------------------------------------------------------
// Everything below these lines are special hotkeys I made.

// First trick key--when you hit 0, only send it to the window where your mouse is.
// 
<Hotkey ScrollLockOn 0>
	<SendFocusWin>
	<Key 0>

}

	puts $hK {// More magic. I redefined alt-1
// When you hit it, it will send alt-1 AND F11 (which is a macro that says /assist Furyswipes)
// So alt-1 forces people to assist main.
// I do it this way so you only have to change one macro to change your main.
// Don't put assist in your dps macros.
<Hotkey ScrollLockOn Alt 1>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<Key Alt 1>"
	add_assist
	puts $hK ""
	puts $hK {// Same magic for 2}
	puts $hK {// WITH A TWIST--MELEE INTERACT WITH TARGET!}
	puts $hK {<Hotkey ScrollLockOn 2>}
	add_assist
	if {$meleeiwt && $meleelabels!=""} {
	  if { $sendwwithiwt } {
	  	puts $hK "\t<SendLabel ${meleelabels}>"
	  	puts $hK "\t<Key w>"
	  }
	  puts $hK "\t<SendLabel ${meleelabels}>"
	  puts $hK "\t<Key f>"
        }
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<Key %Trigger%>"
	if { $game=="wotlk" || $game=="tbc" } {
		puts $hK "\t<Key Shift 5>"
		puts $hK "\t<Key Shift 6>"
	}
	puts $hK ""
	puts $hK {// Same magic for 3,5,6}
	puts $hK {// WITH A TWIST--MELEE INTERACT WITH TARGET!}
	puts $hK {<Hotkey ScrollLockOn 3,5,6>}
	add_assist
	if {$meleeiwt && $meleelabels!=""} {
	  if { $sendwwithiwt } {
	  	puts $hK "\t<SendLabel ${meleelabels}>"
	  	puts $hK "\t<Key w>"
	  }
	  puts $hK "\t<SendLabel ${meleelabels}>"
	  puts $hK "\t<Key f>"
        }
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<Key %Trigger%>"
	if { $game=="wotlk" || $game=="tbc" } {
		puts $hK "\t<Key Shift 7>"
	}
	puts $hK {<Hotkey ScrollLockOn 1>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<Key 1>"
	if { $game!="bfa" && $game !="wotlk"} {
		puts $hK "\t<SendLabel $winlabels>"
		puts $hK {	<Key Shift F1>}
		puts $hK {	<Toggle>}
		puts $hK "\t<SendLabel $winlabels>"
		puts $hK {	<Key Shift F2>}
		puts $hK {	<Toggle>}
		puts $hK "\t<SendLabel $winlabels>"
		puts $hK {	<Key Shift F3>}
		puts $hK {	<Toggle>}
		puts $hK "\t<SendLabel $winlabels>"
		puts $hK {	<Key Shift F4>}
		puts $hK {	<Toggle>}
		puts $hK "\t<SendLabel $winlabels>"
		puts $hK {	<Key Shift F5>}
		puts $hK {	<Toggle>}
		puts $hK "\t<SendLabel $winlabels>"
		puts $hK {	<Key Shift F6>}
		puts $hK ""
	} 
	puts $hK ""
	puts $hK {// Now--ANY KEY that uses a HKN MODIFIER (alt/ctrl/shift) WILL NOT WORK.
// UNLESS.......you define it!
<Hotkey ScrollLockOn Alt 2>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 2> 
<Hotkey ScrollLockOn Alt 3>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 3> }
	puts $hK ""
	puts $hK {// Now, alt-4 is a special key for 5-minute multiboxing.
// So alt-4 is how you make your toons follow again.
// YOU WILL USE ALT-4 CONSTANTLY. GET USED TO IT, SUCKAS.
<Hotkey ScrollLockOn Alt 4>}
        if { $game!="bfa" } {
		if {$hunterlabels!=""} {
			puts $hK "\t<SendLabel ${hunterlabels}>"
			if { $huntermeleeonfollow } {
		  	puts $hK "\t<Key Shift 0>"
	        	}  else {
		  	puts $hK "\t<Key Shift 9>"
	        	}
		}	
	}
	puts $hK "\t<ResetToggles>"
	#add_follow $winlabels
	puts $hK "\t<SendFocusWin>"
	puts $hK "\t\t<Key Shift f7>"
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 4>}
	puts $hK ""
	puts $hK {// F is my favorite new key. It is mapped to "Interact with target" keybind.
// When you hit it the first time, everyone will assist your leader.
// When you hit it a second time. LEEEEEEEEROYYYYYY!!!!!!!
// Everyone will attack your target or open a vendor, OR skin a dead animal,
// ...you get the idea.}
if { ! ( $game=="tbc" || $game=="vanilla" ) } {
	puts $hK {
<Hotkey ScrollLockOn f>
	}
	add_assist
	puts $hK {	<toggle>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key f>}
	puts $hK ""
}
	puts $hK {// Awesome magic here. I put an interrupt skill in shift-3 action bar.
// this goes through each one at a time
// (after focusing on main's target on the first click)
<Hotkey ScrollLockOn Shift 3>}
	add_assist
	for { set i 0 } { $i<$totallabels } { incr i } {
		puts $hK "\t<SendLabel w${i}>"
		puts $hK "\t<Key Shift 3>"
		puts $hK "\t<Toggle>"
	}
	puts $hK ""
	puts $hK {// Shift-4 is also a skill that focuses tank target.
<Hotkey ScrollLockOn Shift 4> }
        add_assist
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK "\t<Key Shift 4>"
	puts $hK ""
	puts $hK {// More boring modifier maps--has to be done}
	puts $hK {<Hotkey ScrollLockOn Alt 5>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 5> }
	puts $hK {<Hotkey ScrollLockOn Alt 6>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 6> }
	puts $hK {<Hotkey ScrollLockOn Alt 7>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 7> }
	puts $hK {<Hotkey ScrollLockOn Alt 8>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 8> }
	puts $hK {<Hotkey ScrollLockOn Alt 9>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 9> }
	puts $hK {<Hotkey ScrollLockOn Alt 0>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt 0> }
	puts $hK {<Hotkey ScrollLockOn Alt Plus>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt Plus> }
	puts $hK {<Hotkey ScrollLockOn Alt Minus>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt Minus> }
	puts $hK {// Special one for ctrl-alt-1 if you ever need it.}
	puts $hK {<Hotkey ScrollLockOn Ctrl Alt 1>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl Alt 1>}
	puts $hK {<Hotkey ScrollLockOn Alt F1>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Alt F1>}
	puts $hK {<Hotkey ScrollLockOn Ctrl 1>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 1>}
	puts $hK {<Hotkey ScrollLockOn Ctrl 2> }
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 2> }
	puts $hK {<Hotkey ScrollLockOn Ctrl 3>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 3> }
	puts $hK {<Hotkey ScrollLockOn Ctrl 4>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 4> }
	puts $hK {<Hotkey ScrollLockOn Ctrl 5>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 5> }
	puts $hK {<Hotkey ScrollLockOn Ctrl 6>}
	puts $hK "\t<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 6> }
	puts $hK {<Hotkey ScrollLockOn Ctrl 7>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 7> }
	puts $hK {<Hotkey ScrollLockOn Ctrl 8>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 8> }
	puts $hK {<Hotkey ScrollLockOn Ctrl 9>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 9> }
	puts $hK {<Hotkey ScrollLockOn Ctrl 0>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl 0> }
	puts $hK {<Hotkey ScrollLockOn Ctrl Plus>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl Plus> }
	puts $hK {<Hotkey ScrollLockOn Ctrl Minus>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Ctrl Minus> }
	puts $hK {<Hotkey ScrollLockOn Shift 1>}
	add_assist
	puts $hK "\t<toggle>"
	foreach win [split $winlabels ","] { 
	  puts $hK "	<SendLabel $win>"
	  puts $hK {	<Key Shift 1>}
	  puts $hK "\t<toggle>"
	}
	puts $hK {// Shift 2 is the polymorph button. First click is assist tank, second click is poly}
	puts $hK {<Hotkey ScrollLockOn Shift 2>}
	add_assist
	puts $hK {	<toggle>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift 2> }
	puts $hK {<Hotkey ScrollLockOn Shift 5>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift 5> }
	puts $hK {<Hotkey ScrollLockOn Shift 6>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift 6> }
	puts $hK {<Hotkey ScrollLockOn Shift 7>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift 7> }
	puts $hK {<Hotkey ScrollLockOn Shift 8>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift 8> }
	puts $hK {<Hotkey ScrollLockOn Shift 9>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift 9> }
	puts $hK {<Hotkey ScrollLockOn Shift 0>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift 0> }
	puts $hK {<Hotkey ScrollLockOn Shift Plus>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift Plus> }
	puts $hK {<Hotkey ScrollLockOn Shift Minus>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift Minus> }
	puts $hK {<Hotkey ScrollLockOn Shift F1>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F1>}
	puts $hK {<Hotkey ScrollLockOn Shift F2>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F2> }
	puts $hK {<Hotkey ScrollLockOn Shift F3>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F3> }
	puts $hK {<Hotkey ScrollLockOn Shift F4>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F4> }
	puts $hK {<Hotkey ScrollLockOn Shift F5>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F5> }
	puts $hK {<Hotkey ScrollLockOn Shift F6>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F6> }
	puts $hK {<Hotkey ScrollLockOn Shift F7>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F7> }
	puts $hK {<Hotkey ScrollLockOn Shift F8>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F8> }
	puts $hK {<Hotkey ScrollLockOn Shift F9>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F9> }
	puts $hK {<Hotkey ScrollLockOn Shift F10>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F10> }
	puts $hK {<Hotkey ScrollLockOn Shift F11>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F11> }
	puts $hK {<Hotkey ScrollLockOn Shift F12>}
	puts $hK "	<SendLabel $winlabels>"
	puts $hK {	<Key Shift F12> }
	puts $hK ""
	close $hK
}
if { ! $nosmoverwrite } { 
	set INSTUFF2TRACK false
	set INAUTODELETE false
	set INTHELIST false
	set INLEVPART false
	set sM [open $SME r]
	set sMN [open tmp w+]
	while { [gets $sM line] >= 0 } {
	  if { [regexp "^FSMB_game" $line ] } {
	    puts $sMN "FSMB_game=\"$game\""
          } elseif { [regexp "^FSMB_dontsetcamera" $line ] } {
	    puts $sMN "FSMB_dontsetcamera=$dontsetcamera"
          } elseif { [regexp "^FSMB_dontsetleadercamera" $line ] } {
	    puts $sMN "FSMB_dontsetleadercamera=$dontsetleadercamera"
          } elseif { [regexp "^FSMB_tank" $line ] } {
	    puts -nonewline $sMN "FSMB_tank="
	    set found_tank false
	    for { set i 0 } { $i<[array size toons] } { incr i } {
	      if { ! $found_tank && [string tolower [lindex $toons($i) 4]] == "tank" } {
	        set name [string totitle [ string tolower [lindex $toons($i) 3]]]
	        if { [regexp {\-} $name] } { 
		      regexp "(.*)-" $name match name
	        }
		set found_tank true
	        puts $sMN \"[altname $name]\"
	      }
	    }
	    if { ! $found_tank } { puts $sMN \"\" }
          } elseif { [regexp "^FSMB_nomacros" $line ] } {
	    if { $nomacros=="true" } {
	    	puts $sMN "FSMB_nomacros=true"
	    } else { 
		puts $sMN "FSMB_nomacros=nil"
	    }
	  } elseif { [regexp "^FSMB_healerlist" $line ] } {
	    puts -nonewline $sMN "FSMB_healerlist=\{"
	    set first false
	    for { set i 0 } { $i<[array size toons] } { incr i } {
	      if { [ string tolower [lindex $toons($i) 4]] == "healer" } {
	        set name [string totitle [ string tolower [lindex $toons($i) 3]]]
	        if { [regexp {\-} $name] } { 
		      regexp "(.*)-" $name match name
	        }
	        if { $first=="false" } { 
	          puts -nonewline $sMN \"[altname $name]\"
	          set first true
	        } else {
	          puts -nonewline $sMN ,\"[altname $name]\"
	        } 
	      }
	    }
	    puts $sMN "\}"
	  } elseif { [regexp "^FSMB_invitelist" $line ] } {
	    set toonno 1
	    puts -nonewline $sMN "FSMB_invitelist=\{"
	    set first false
	    for { set i 0 } { $i<[array size toons] } { incr i } {
	      set name [string totitle [ string tolower [lindex $toons($i) 3]]]
	      if { $first=="false" } { 
	        puts -nonewline $sMN \[$toonno\]=\"[altname $name]\"
	        set first true
	      } else {
	        puts -nonewline $sMN ,\[$toonno\]=\"[altname $name]\"
	      } 
	      incr toonno
	    }
	    puts $sMN "\}"
	  } elseif { [regexp "^FSMB_toonlist" $line ] } {
	    set toonno 1
	    puts -nonewline $sMN "FSMB_toonlist=\{"
	    set first false
	    for { set i 0 } { $i<[array size toons] } { incr i } {
	      set name [string totitle [ string tolower [lindex $toons($i) 3]]]
	      if { [regexp {\-} $name] } { 
		      regexp "(.*)-" $name match name
	      }
	      if { $first=="false" } { 
	        puts -nonewline $sMN \[$toonno\]=\"[altname $name]\"
	        set first true
	      } else {
	        puts -nonewline $sMN ,\[$toonno\]=\"[altname $name]\"
	      } 
	      incr toonno
	    }
	    puts $sMN "\}"
	 } elseif { [regexp "^FSMB_RAID" $line ] && $raidname!="" } {
	    puts $sMN "FSMB_RAID = \"MULTIBOX_[altname $raidname]\""
		} elseif { [regexp "^FSMB_powerleveler" $line ] && $powerleveler!="" } {
	    set powerleveler [string totitle [ string tolower $powerleveler]]
	    puts $sMN "FSMB_powerleveler=\"[altname $powerleveler]\""
		} elseif { [regexp "^FSMB_bomfollow" $line ] && $bombfollow!="" } {
	    set bombfollow [string totitle [ string tolower $bombfollow]]
	    puts $sMN "FSMB_bombfollow=\"[altname $bombfollow]\""
		} elseif { [regexp "^FSMB_gazefollow" $line ] && $gazefollow!="" } {
	    set gazefollow [string totitle [ string tolower $gazefollow]]
	    puts $sMN "FSMB_gazefollow=\"[altname $gazefollow]\""
		} elseif { [regexp "^FSMB_burningfollow" $line ] && $burningfollow!="" } {
	    set burningfollow [string totitle [ string tolower $burningfollow]]
	    puts $sMN "FSMB_burningfollow=\"[altname $burningfollow]\""
	  } elseif { [regexp "^FSMB_dedicated_healers" $line ] } {
	    puts -nonewline $sMN "FSMB_dedicated_healers=\{"
	    set first true
	    foreach { tank healer } $dedicated_healers {
	      if { [regexp {\-} $tank] } { 
		      regexp "(.*)-" $tank match tank
	      }
	      if { [regexp {\-} $healer] } { 
		      regexp "(.*)-" $healer match healer
	      }
	      set tank [string totitle [ string tolower $tank]]
	      set healer [string totitle [ string tolower $healer]]
	      if { $first=="true" } { 
	        puts -nonewline $sMN "[altname $tank]=\"[altname $healer]\""
	        set first false
	      } else {
	        puts -nonewline $sMN ",[altname $tank]=\"[altname $healer]\""
	      } 
	    }
	    puts $sMN "\}"
	  } elseif { [regexp "^FSMB_maxheal" $line ] && $maxheal!="" } {
	    puts -nonewline $sMN "FSMB_maxheal=\{Druid=[lindex $maxheal 0],Priest=[lindex $maxheal 1],Shaman=[lindex $maxheal 2],Paladin=[lindex $maxheal 3]"
	    puts $sMN "\}"
		} elseif { [regexp "^FSMB_soulstone_rezzers" $line ] && $dontsoulstone == "true" } {
	    puts $sMN "FSMB_soulstone_rezzers=false"
		} elseif { [regexp "^FSMB_soulstone_rezzers" $line ] && $dontsoulstone == "" } {
	    puts $sMN "FSMB_soulstone_rezzers=true"
		} elseif { [regexp "^FSMB_frameflash" $line ] && $dontflashframe == "true" } {
	    puts $sMN "FSMB_frameflash=false"
		} elseif { [regexp "^FSMB_frameflash" $line ] && $dontflashframe == "" } {
	    puts $sMN "FSMB_frameflash=true"
		} elseif { [regexp "^FSMB_dontsetcamera" $line ] && $dontsetcamera == "true" } {
	    puts $sMN "FSMB_dontsetcamera=true"
		} elseif { [regexp "^FSMB_dontsetcamera" $line ] && $dontsetcamera == "" } {
	    puts $sMN "FSMB_dontsetcamera=false"
		} elseif { [regexp "^FSMB_dontsetleadercamera" $line ] && $dontsetleadercamera == "true" } {
	    puts $sMN "FSMB_dontsetleadercamera=true"
		} elseif { [regexp "^FSMB_dontsetleadercamera" $line ] && $dontsetleadercamera == "" } {
	    puts $sMN "FSMB_dontsetleadercamera=false"
		} elseif { [regexp "^FSMB_autotrade=" $line ] && $useautotrade == "true" } {
	    puts $sMN "FSMB_autotrade=true"
		} elseif { [regexp "^FSMB_autotrade=" $line ] && $useautotrade == "" } {
	    puts $sMN "FSMB_autotrade=false"
		} elseif { [regexp "^FSMB_autodelete" $line ] && $dontautodelete == "true" } {
	    puts $sMN "FSMB_autodelete=false"
		} elseif { [regexp "^FSMB_autodelete" $line ] && $dontautodelete == "" } {
	    puts $sMN "FSMB_autodelete=true"
		} elseif { [regexp "^FSMB_buystacks" $line ] && $dontbuystacks == "true" } {
	    puts $sMN "FSMB_buystacks=false"
		} elseif { [regexp "^FSMB_buystacks" $line ] && $dontbuystacks == "" } {
	    puts $sMN "FSMB_buystacks=true"
		} elseif { [regexp "^FSMB_autopass" $line ] && $dontautopass == "true" } {
	    puts $sMN "FSMB_autopass=false"
		} elseif { [regexp "^FSMB_autopass" $line ] && $dontautopass == "" } {
	    puts $sMN "FSMB_autopass=true"
		} elseif { [regexp "^FSMB_autoturn" $line ] && $autoturn == "true" } {
	    puts $sMN "FSMB_autoturn=true"
		} elseif { [regexp "^FSMB_autoturn" $line ] && $autoturn == "" } {
	    puts $sMN "FSMB_autoturn=false"
		} elseif { [regexp "^FSMB_clearcastAM" $line ] && $clearcastmissiles == "true" } {
	    puts $sMN "FSMB_clearcastAM=true"
		} elseif { [regexp "^FSMB_clearcastAM" $line ] && $clearcastmissiles == "" } {
	    puts $sMN "FSMB_clearcastAM=false"
		} elseif { [regexp "^FSMB_default_warlock_pet" $line ] && $warlockpet != "" } {
	      set warlockpet [string totitle [ string tolower $warlockpet]]
	    	puts $sMN "FSMB_default_warlock_pet=\"$warlockpet\""
		} elseif { [regexp "^FSMB_default_warlock_pet" $line ] && $warlockpet == "" } {
	    	puts $sMN "FSMB_default_warlock_pet=\"Imp\""
		} elseif { [regexp "^FSMB_hellfire_threshold" $line ] && $healhellfireat != "" } {
	    puts $sMN "FSMB_hellfire_threshold=$healhellfireat"
		} elseif { [regexp "^FSMB_hellfire_threshold" $line ] && $healhellfireat == "" } {
	    puts $sMN "FSMB_hellfire_threshold=.85"
		} elseif { [regexp "^FSMB_healtank_threshold" $line ] && $healtankat != "" } {
	    puts $sMN "FSMB_healtank_threshold=$healtankat"
		} elseif { [regexp "^FSMB_healtank_threshold" $line ] && $healtankat == "" } {
	    puts $sMN "FSMB_healtank_threshold=.5"
		} elseif { [regexp "^FSMB_healchump_threshold" $line ] && $healchumpat != "" } {
	    puts $sMN "FSMB_healchump_threshold=$healchumpat"
		} elseif { [regexp "^FSMB_healchump_threshold" $line ] && $healchumpat == "" } {
	    puts $sMN "FSMB_healchump_threshold=.33"
		} elseif { [regexp "^FSMB_healself_threshold" $line ] && $healselfat != "" } {
	    puts $sMN "FSMB_healself_threshold=$healselfat"
		} elseif { [regexp "^FSMB_healself_threshold" $line ] && $healselfat == "" } {
	    puts $sMN "FSMB_healself_threshold=.3"
		} elseif { [regexp "^FsR_Stuff2Track" $line ] } {
				set INSTUFF2TRACK true
		} elseif {$INSTUFF2TRACK && ![regexp "^FsR" $line] } {
		} elseif {$INSTUFF2TRACK && [regexp "^FsR" $line] && ![regexp "^FsR_Stuff2Track" $line] } {
				set INSTUFF2TRACK false
	    	puts $sMN "FsR_Stuff2Track=\{"
				if { $goldto!="" } {
	        set goldto [string totitle [ string tolower $goldto]]
	    		puts $sMN "\t\[\"Gold\"\] = \{itemkind = \"special\", collector = \{\"[altname $goldto]\"\}\},"
				} else {
	    		puts $sMN "\t\[\"Gold\"\] = \{itemkind = \"special\", collector = \{\"\"\}\},"
				}
				puts $sMN  	{	["EmptyBagSlots"] = {itemkind = "special"},
 	["Soul Shard"] = {itemkind = "special"},
	["Sacred Candle"] = {itemkind = "item" , class = {Priest = {AnnounceValue = 5}}},
 	["Symbol of Kings"] = {itemkind = "item" , class = {Paladin = {AnnounceValue = 5}}},
 	["Wild Thornroot"] = {itemkind = "item" , class = {Druid = {AnnounceValue = 5}}},
 	["Major Healing Potion"] = {itemkind = "item", class = {Druid = {},Rogue = {},Warrior = {},Hunter = {},Warlock = {},Mage = {}, Priest = {}, Shaman = {}, Paladin = {}}},
	["Major Mana Potion"] = {itemkind = "item" , class = {Druid = {}, Priest = {}, Shaman = {}, Paladin = {}}},}
				if { $boeto!="" } {
	    		puts -nonewline $sMN "\t\[\"BOE\"\] = \{itemkind = \"itemGrp\", collector = \{"
	    	  set first true
					foreach boetoon $boeto { 
	          set boetoon [string totitle [ string tolower $boetoon]]
					  if { $first } { 
						  puts -nonewline $sMN \"[altname $boetoon]\"
							set first false
						} else {
						  puts -nonewline $sMN ,\"[altname $boetoon]\"
			      }
					}
					puts $sMN "\}\},"
				} else {
	    		puts $sMN "\t\[\"BOE\"\] = \{itemkind = \"itemGrp\", collector = \{\"\"\}\},"
				}
				if { [array size itemto] > 0 } {
					foreach item [array names itemto ] {
						puts -nonewline $sMN "\t\[\"$item\"\] = \{itemkind = \"itemGrp\", collector = \{"					
							set first true
	            foreach coll $itemto($item) { 
	              set coll [string totitle [ string tolower $coll]]
								if { $first } {
									puts -nonewline $sMN \"[altname $coll]\"
									set first false
								} else {
									puts -nonewline $sMN ,\"[altname $coll]\"
								}
							}
							puts $sMN "\}\},"
					  }
					} else {
	    			puts $sMN "\t\[\"Lockbox\"\] = \{itemkind = \"itemGrp\", collector = \{\"\"\}\},"
					}
	 		puts $sMN {	["Conjured Sparkling Water"] = {itemkind = "item" , class = {Mage={Ratio=2},Hunter = {Ratio=1}, Warlock = {Ratio=1},Druid = {Ratio=1}, Priest = {Ratio=1}, Shaman = {Ratio=1}, Paladin = {Ratio=1}}}}
			puts $sMN "\}"
			puts $sMN $line
		} elseif { [regexp "^FSMB_TheList" $line ] } {
				set INTHELIST true
		} elseif {$INTHELIST && ![regexp "^\}" $line] } {
		} elseif {$INTHELIST && [regexp "^\}" $line] } {
			set INTHELIST false
	   	puts $sMN "FSMB_TheList=\{"
	 	  set first true
		  foreach item [array names autodelete] {
	      if { $first } { 
					puts -nonewline $sMN "\t\[\"$item\"\]=$autodelete($item)"
					set first false
				} else {
					puts -nonewline $sMN ",\n\t\[\"$item\"\]=$autodelete($item)"
			  }
			}
			puts $sMN ""
			puts $sMN $line
		} elseif { [regexp "^FSMB_levelingparties" $line ] } {
			set INLEVPART true
		} elseif {$INLEVPART && ![regexp "^\}" $line] } {
		} elseif {$INLEVPART && [regexp "^\}" $line] } {
			set INLEVPART false
			set firstparty false
	   	puts $sMN "FSMB_levelingparties=\{"
			set firstsq true
		  foreach sql [array names levelingparties] { 
	      set sql [string totitle [ string tolower $sql]]
				set sq $levelingparties($sql) 
				if { !$firstsq } { 
				  puts -nonewline $sMN ",\n\t${sql}=\{"
				} else { 
					puts -nonewline $sMN "\t${sql}=\{"
					set firstsq false
				}
				set firstmem true
				foreach sqmem $sq {
	        set sqmem [string totitle [ string tolower $sqmem]]
					if { !$firstmem } { 
						puts -nonewline $sMN ","
						puts -nonewline $sMN "\"$sqmem\""
					} else {
						set firstmem false
						puts -nonewline $sMN "\"$sqmem\""
					}
				}
				puts -nonewline $sMN "\}"
			}
			puts $sMN ""
			puts $sMN $line
	  } else {
	    puts $sMN $line
	  }
	}
	close $sMN
	close $sM
	file copy -force tmp $SME
	file delete tmp
}
