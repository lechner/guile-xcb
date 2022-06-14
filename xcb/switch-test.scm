 ;; This file is part of Guile XCB.

 ;;    Guile XCB is free software: you can redistribute it and/or modify
 ;;    it under the terms of the GNU General Public License as published by
 ;;    the Free Software Foundation, either version 3 of the License, or
 ;;    (at your option) any later version.

 ;;    Guile XCB is distributed in the hope that it will be useful,
 ;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
 ;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ;;    GNU General Public License for more details.

 ;;    You should have received a copy of the GNU General Public License
 ;;    along with Guile XCB.  If not, see <http://www.gnu.org/licenses/>.

(define-module (xcb switch-test)
  #:use-module (srfi srfi-64)
  #:use-module (sxml simple)
  #:use-module (ice-9 binary-ports)
  #:use-module (ice-9 receive)
  #:use-module (language xml-xcb struct)
  #:use-module (language xml-xcb records)
  #:use-module (xcb connection)
  #:use-module (system base compile)
  #:use-module (language xml-xcb type)
  #:use-module (language xml-xcb enum)
  #:use-module (ice-9 pretty-print)
  #:use-module (language scheme spec)
  #:use-module (language xml-xcb spec))

(define (test-reader string)
  (xml->sxml string #:trim-whitespace? #t))

(define-public (pack-xcb-struct-to-bytevector xcb-struct rec)
  (call-with-values
      (lambda ()
        (open-bytevector-output-port))
    (lambda (port get-bytevector)
      (xcb-struct-pack rec port)
      (get-bytevector))))

(define in-extension? #f)

(define-public test-xml "<test-root><xcb header=\"xkb\"></xcb>
<xcb-2 header=\"xcb\"></xcb-2>
	<enum name=\"NKNDetail\">
		<item name=\"Keycodes\"> <bit>0</bit> </item>
		<item name=\"Geometry\"> <bit>1</bit> </item>
		<item name=\"DeviceID\"> <bit>2</bit> </item>
	</enum>

	<enum name=\"StatePart\">
		<item name=\"ModifierState\">     <bit>0</bit> </item>
		<item name=\"ModifierBase\">      <bit>1</bit> </item>
		<item name=\"ModifierLatch\">     <bit>2</bit> </item>
		<item name=\"ModifierLock\">      <bit>3</bit> </item>
		<item name=\"GroupState\">        <bit>4</bit> </item>
		<item name=\"GroupBase\">         <bit>5</bit> </item>
		<item name=\"GroupLatch\">        <bit>6</bit> </item>
		<item name=\"GroupLock\">         <bit>7</bit> </item>
		<item name=\"CompatState\">       <bit>8</bit> </item>
		<item name=\"GrabMods\">          <bit>9</bit> </item>
		<item name=\"CompatGrabMods\">    <bit>10</bit> </item>
		<item name=\"LookupMods\">        <bit>11</bit> </item>
		<item name=\"CompatLookupMods\">  <bit>12</bit> </item>
		<item name=\"PointerButtons\">    <bit>13</bit> </item>
	</enum>

	<enum name=\"Control\" >
		<item name=\"GroupsWrap\">      <bit>27</bit> </item>
		<item name=\"InternalMods\">    <bit>28</bit> </item>
		<item name=\"IgnoreLockMods\">  <bit>29</bit> </item>
		<item name=\"PerKeyRepeat\">    <bit>30</bit> </item>
		<item name=\"ControlsEnabled\"> <bit>31</bit> </item>
	</enum>

	<enum name=\"NameDetail\">
		<item name=\"Keycodes\">        <bit>0</bit> </item>
		<item name=\"Geometry\">        <bit>1</bit> </item>
		<item name=\"Symbols\">         <bit>2</bit> </item>
		<item name=\"PhysSymbols\">     <bit>3</bit> </item>
		<item name=\"Types\">           <bit>4</bit> </item>
		<item name=\"Compat\">          <bit>5</bit> </item>
		<item name=\"KeyTypeNames\">    <bit>6</bit> </item>
		<item name=\"KTLevelNames\">    <bit>7</bit> </item>
		<item name=\"IndicatorNames\">  <bit>8</bit> </item>
		<item name=\"KeyNames\">        <bit>9</bit> </item>
		<item name=\"KeyAliases\">      <bit>10</bit> </item>
		<item name=\"VirtualModNames\"> <bit>11</bit> </item>
		<item name=\"GroupNames\">      <bit>12</bit> </item>
		<item name=\"RGNames\">         <bit>13</bit> </item>
	</enum>

	<enum name=\"CMDetail\">
		<item name=\"SymInterp\">   <bit>0</bit> </item>
		<item name=\"GroupCompat\"> <bit>1</bit> </item>
	</enum>

	<enum name=\"AXNDetail\">
		<item name=\"SKPress\">      <bit>0</bit> </item>
		<item name=\"SKAccept\">     <bit>1</bit> </item>
		<item name=\"SKReject\">     <bit>2</bit> </item>
		<item name=\"SKRelease\">    <bit>3</bit> </item>
		<item name=\"BKAccept\">     <bit>4</bit> </item>
		<item name=\"BKReject\">     <bit>5</bit> </item>
		<item name=\"AXKWarning\">   <bit>6</bit> </item>
	</enum>

	<enum name=\"XIFeature\">
		<item name=\"Keyboards\">      <bit>0</bit> </item>
		<item name=\"ButtonActions\">  <bit>1</bit> </item>
		<item name=\"IndicatorNames\"> <bit>2</bit> </item>
		<item name=\"IndicatorMaps\">  <bit>3</bit> </item>
		<item name=\"IndicatorState\"> <bit>4</bit> </item>
	</enum>

	<typedef oldname=\"CARD16\" newname=\"DeviceSpec\" />

	<enum name=\"EventType\">
		<item name=\"NewKeyboardNotify\">      <bit>0</bit> </item>
		<item name=\"MapNotify\">              <bit>1</bit> </item>
		<item name=\"StateNotify\">            <bit>2</bit> </item>
		<item name=\"ControlsNotify\">         <bit>3</bit> </item>
		<item name=\"IndicatorStateNotify\">   <bit>4</bit> </item>
		<item name=\"IndicatorMapNotify\">     <bit>5</bit> </item>
		<item name=\"NamesNotify\">            <bit>6</bit> </item>
		<item name=\"CompatMapNotify\">        <bit>7</bit> </item>
		<item name=\"BellNotify\">             <bit>8</bit> </item>
		<item name=\"ActionMessage\">          <bit>9</bit> </item>
		<item name=\"AccessXNotify\">          <bit>10</bit> </item>
		<item name=\"ExtensionDeviceNotify\">  <bit>11</bit> </item>
	</enum>

	<enum name=\"MapPart\">
		<item name=\"KeyTypes\">            <bit>0</bit> </item>
		<item name=\"KeySyms\">             <bit>1</bit> </item>
		<item name=\"ModifierMap\">         <bit>2</bit> </item>
		<item name=\"ExplicitComponents\">  <bit>3</bit> </item>
		<item name=\"KeyActions\">          <bit>4</bit> </item>
		<item name=\"KeyBehaviors\">        <bit>5</bit> </item>
		<item name=\"VirtualMods\">         <bit>6</bit> </item>
		<item name=\"VirtualModMap\">       <bit>7</bit> </item>
	</enum>

        <request name=\"SwitchInReply\" opcode=\"2\">
                <field name=\"thing1\" type=\"CARD32\" />
                <field name=\"thing2\" type=\"CARD32\" />
                <reply>
                        <field name=\"mask\" type=\"CARD8\" mask=\"MapPart\" />
                        <switch name=\"details\">
                                <fieldref>mask</fieldref>
                                <bitcase>
                                        <enumref ref=\"MapPart\">KeyTypes</enumref>
                                        <field name=\"list-length\" type=\"CARD16\" />
                                        <pad bytes=\"4\" />
                                        <list name=\"my-list\" type=\"CARD16\">
                                                <fieldref>list-length</fieldref>
                                        </list>
                                </bitcase>
                                <bitcase>
                                        <enumref ref=\"MapPart\">KeySyms</enumref>
                                        <field name=\"bob\" type=\"CARD8\" />
                                        <pad bytes=\"3\" />
                                </bitcase>
                                <field name=\"switch-default\" type=\"CARD32\" />
                        </switch>
                </reply>
        </request>

	<request name=\"SelectEvents\" opcode=\"1\">
		<field name=\"deviceSpec\" type=\"DeviceSpec\" />
		<field name=\"affectWhich\" type=\"CARD16\" mask=\"EventType\" />
		<field name=\"clear\" type=\"CARD16\" mask=\"EventType\" />
		<field name=\"selectAll\" type=\"CARD16\" mask=\"EventType\" />
		<field name=\"affectMap\" type=\"CARD16\" mask=\"MapPart\" />
		<field name=\"map\" type=\"CARD16\" mask=\"MapPart\" />
		<switch name=\"details\">
			<op op=\"&amp;\">
				<fieldref>affectWhich</fieldref>
				<op op=\"&amp;\">
					<unop op=\"~\"><fieldref>clear</fieldref></unop>
					<unop op=\"~\"><fieldref>selectAll</fieldref></unop>
				</op>
			</op>
			<bitcase>
				<enumref ref=\"EventType\">NewKeyboardNotify</enumref>
				<field name=\"affectNewKeyboard\" type=\"CARD16\" mask=\"NKNDetail\" />
				<field name=\"newKeyboardDetails\" type=\"CARD16\" mask=\"NKNDetail\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">StateNotify</enumref>
				<field name=\"affectState\" type=\"CARD16\" mask=\"StatePart\" />
				<field name=\"stateDetails\" type=\"CARD16\" mask=\"StatePart\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">ControlsNotify</enumref>
				<field name=\"affectCtrls\" type=\"CARD32\" mask=\"Control\" />
				<field name=\"ctrlDetails\" type=\"CARD32\" mask=\"Control\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">IndicatorStateNotify</enumref>
				<field name=\"affectIndicatorState\" type=\"CARD32\" />
				<field name=\"indicatorStateDetails\" type=\"CARD32\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">IndicatorMapNotify</enumref>
				<field name=\"affectIndicatorMap\" type=\"CARD32\" />
				<field name=\"indicatorMapDetails\" type=\"CARD32\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">NamesNotify</enumref>
				<field name=\"affectNames\" type=\"CARD16\" mask=\"NameDetail\" />
				<field name=\"namesDetails\" type=\"CARD16\" mask=\"NameDetail\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">CompatMapNotify</enumref>
				<field name=\"affectCompat\" type=\"CARD8\" mask=\"CMDetail\" />
				<field name=\"compatDetails\" type=\"CARD8\" mask=\"CMDetail\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">BellNotify</enumref>
				<field name=\"affectBell\" type=\"CARD8\" />
				<field name=\"bellDetails\" type=\"CARD8\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">ActionMessage</enumref>
				<field name=\"affectMsgDetails\" type=\"CARD8\" />
				<field name=\"msgDetails\" type=\"CARD8\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">AccessXNotify</enumref>
				<field name=\"affectAccessX\" type=\"CARD16\" mask=\"AXNDetail\" />
				<field name=\"accessXDetails\" type=\"CARD16\" mask=\"AXNDetail\" />
			</bitcase>
			<bitcase>
				<enumref ref=\"EventType\">ExtensionDeviceNotify</enumref>
				<field name=\"affectExtDev\" type=\"CARD16\" mask=\"XIFeature\" />
				<field name=\"extdevDetails\" type=\"CARD16\" mask=\"XIFeature\" />
			</bitcase>
                        <field name=\"default\" type=\"CARD16\" />
		</switch>
	</request>

</test-root>")

(define no-new-xcb-module? #t)

(define-public (print-scheme)
  (set! no-new-xcb-module? #f)
  (for-each
   (lambda (sxml)
     (pretty-print (compile sxml #:from xml-xcb #:env (current-module) #:to scheme)))
   (cdadr (test-reader test-xml)))
  (set! no-new-xcb-module? #t))

(map
 (lambda (sxml)
   (compile sxml #:from xml-xcb #:env (current-module)))
 (cdadr (test-reader test-xml)))

(set-extension-opcode! 100)

(test-begin "xcb-switch-test")

(receive (conn get-bytevector) (mock-connection #vu8() (make-hash-table) (make-hash-table))
  (select-events/c conn 12
                 '(new-keyboard-notify)
                 '(state-notify)
                 '(state-notify)
                 '(key-actions)
                 '(key-actions)
                 '((affect-new-keyboard . (keycodes))
                   (new-keyboard-details . (geometry))))
  (test-equal
   (get-bytevector)
   #vu8(100 1 5 0 12 0 1 0 4 0 4 0 16 0 16 0 1 0 2 0)))

(receive (conn get-bytevector) (mock-connection #vu8() (make-hash-table) (make-hash-table))
  (select-events/c conn 12
                '(new-keyboard-notify controls-notify)
                '(state-notify)
                '(state-notify)
                '(key-actions)
                '(key-actions)
                '((affect-new-keyboard . (keycodes))
                  (new-keyboard-details . (geometry))
                  (affect-ctrls . (groups-wrap))
                  (ctrl-details . (groups-wrap))))
  (test-equal
   (get-bytevector)
   #vu8(100 1 7 0 12 0 9 0 4 0 4 0 16 0 16 0
            1 0 2 0 0 0 0 8 0 0 0 8)))



(test-end "xcb-switch-test")
