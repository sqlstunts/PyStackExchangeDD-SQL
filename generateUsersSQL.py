# -*- coding: utf-8 -*-
__author__ = "SQL Stunts"

# If you don't have this module installed, it's required for the XML parsing
import untangle
import os

# Replace with the actual file path
usersXMLfilePath = "Users.xml"

user_insertStmt = "insert into stackexchangedd.users(Id,CreationDate," + \
                  "DisplayName,DownVotes,LastAccessDate,Reputation,UpVotes,Views,AccountId) " + \
                  "values ({0},'{1}','{2}',{3},'{4}','{5}',{6},{7},{8});"

if __name__ == "__main__":

    if (os.path.exists(usersXMLfilePath)):

        obj = untangle.parse(usersXMLfilePath)
        i = 0
        for row in obj.users.row:
            print user_insertStmt.format(row["Id"].encode("utf-8"), \
                                         row["CreationDate"].encode("utf-8"), row["DisplayName"].encode("utf-8"), \
                                         row["DownVotes"].encode("utf-8"), row["LastAccessDate"].encode("utf-8"), \
                                         row["Reputation"].encode("utf-8"), \
                                         row["UpVotes"].encode("utf-8"), row["Views"].encode("utf-8"), \
                                         row["AccountId"].encode("utf-8"))

            # Check for the nullable columns and, if present, generate the correspondign record updates
            if (row["Age"]):
                print "update stackexchangedd.users set age={0} where id={1};".format(row["Age"].encode("utf-8"),
                                                                                    row["Id"].encode("utf-8"))

            if (row["Location"]):
                print "update stackexchangedd.users set Location='{0}' where id={1};".format(
                    row["Location"].replace("'", "\\'").replace("\"", "\\\" ").encode("utf-8"), row["Id"].encode("utf-8"))

            if (row["AboutMe"]):
                print "update stackexchangedd.users set AboutMe='{0}' where id={1};".format(
                    row["AboutMe"].replace("'", "\\'").replace("\"", "\\\" ").replace("\n", " ").replace("\r", "").encode("utf-8"), row["Id"].encode("utf-8"))
    else:
        print "The file '{0}' does not exist.".format(usersXMLfilePath)
