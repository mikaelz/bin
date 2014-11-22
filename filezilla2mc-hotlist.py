#!/usr/bin/env python
#
# Convert FileZilla sitemanager.xml to Midnight Commander hotlist directory
#
# Usage:
# python ~/bin/filezilla2mc-hotlist.py < ~/.config/filezilla/sitemanager.xml > ~/.config/mc/hotlist

from xml.parsers.expat import ExpatError
from xml.dom import minidom
import sys

def main():
    DEFAULT_ENTRY = { 
        'username': None,
        'password': None,
        'local_dir': None,
        'remote_dir': None,
    }

    try:
        xmldoc = minidom.parse(sys.stdin)
    except ExpatError:
        print >> sys.stderr, 'Error parsing input file'
        sys.exit(1)

    entries = {}
    for server in xmldoc.getElementsByTagName('Server'):
        entry = DEFAULT_ENTRY.copy()

        tmp = server.getElementsByTagName('Host')
        if not tmp:
            continue
        hostname = tmp[0].firstChild.nodeValue

        tmp = server.getElementsByTagName('RemoteDir')
        if tmp and tmp[0].firstChild:
            entry['remote_dir'] = tmp[0].firstChild.nodeValue.split()[-1]
            if len( entry['remote_dir'] ) < 2:
                entry['remote_dir'] = ''

        tmp = server.getElementsByTagName('Port')
        entry['port'] = tmp[0].firstChild.nodeValue

        entries[hostname] = entry

    if entries:
        for hostname in entries.keys():
            entry = entries[hostname]
            out = 'ENTRY "'

            # protocol = 'ftp://' if entry['port'] == '21' else 'sftp://'
            protocol = 'ftp://'
            out += protocol + hostname + '" URL "' + protocol + hostname + '/'
            if entry['remote_dir']: 
                out += entry['remote_dir'] 
            out += '"'

            print ( out )

if __name__ == '__main__':
    main()
