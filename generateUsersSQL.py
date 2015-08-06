# -*- coding: utf-8 -*-
__author__ = "SQL Stunts"

import untangle

user_insertStmt = "insert into StackExchange.Users(Id,AboutMe,CreationDate," + \
                  "DisplayName,DownVotes,LastAccessDate,Location,UpVotes,Views,AccountId) " + \
                  "values ({0},{1},{2},{3},{4},{5},{6},{7},{8});"

if __name__ == "__main__":
    obj = untangle.parse("E:\Temp\coffee.stackexchange.com\Users.xml")
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
            print "update StackExchange.Users set age={0} where id={1};".format(row["Age"].encode("utf-8"),row["Id"].encode("utf-8"))

        if (row["Reputation"]):
            print "update StackExchange.Users set Reputation={0} where id={1};".format(row["Reputation"].encode("utf-8"),row["Id"].encode("utf-8"))

        if (row["AboutMe"]):
            print "update StackExchange.Users set AboutMe='{0}' where id={1};".format(row["AboutMe"].replace("'"," ").replace("\""," ").encode("utf-8"),row["Id"].encode("utf-8"))
