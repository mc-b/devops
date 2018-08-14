Geschichte
----------

![](../../images/Eisenzeit.png)

<p style="font-size: 0.5em">Quelle: www.gauting.de</p>

- - -

Container sind ein altes Konzept. Schon seit Jahrzehnten gibt es in UNIX-Systemen den Befehl chroot, der eine einfache Form der **Dateisystem-Isolation** bietet.

Seit 1998 gibt es in FreeBSD das Jail-Tool, welches das chroot-Sandboxing auf **Prozesse** erweitert. 

Solaris Zones boten 2001 eine recht vollständige Technologie zum Containerisieren, aber diese war auf Solaris OS beschränkt. 

Ebenfalls 2001 veröffentlichte Parallels Inc. (damals noch SWsoft) die kommerzielle Containertechnologie Virtuozzo für Linux, deren Kern später (im Jahr 2005) als Open Source unter dem Namen OpenVZ bereitgestellt wurde.

Dann startete Google die Entwicklung von CGroups für den Linux-Kernel und begann damit, seine Infrastruktur in Container zu verlagern. 

Das Linux Containers Project (LXC) wurde 2008 initiiert, und in ihm wurden (unter anderem) CGroups, Kernel-Namensräume und die chroot-Technologie zusammengeführt, um eine vollständige Containerisierungslösung zu bieten. 

**2013** lieferte Docker schließlich die fehlenden Teile für das Containerisierungspuzzle, und die Technologie begann, den Mainstream zu erreichen.


