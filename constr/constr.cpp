#include <iostream>
#include <cstdlib>
using namespace std;


class Command {
 public:
    string cmd;
    Command(const string& cmd) {
        this->cmd = cmd;
    }
};

void do_command(const Command& cmd) {
    system(cmd.cmd.c_str());
}

int main() {
    string i;  // TODO: change to a better name
    Command d("date +%T");
    Command l("ls -l");
    Command i_("id -Gn");
    Command u("uname -a");
    Command s("sleep 5");

    cin >> i;
    switch (atoi(i.c_str())) {
    case 1:
        do_command(d);
        break;
    case 2:
        do_command(l);
        break;
    case 3:
        do_command(i);
        break;
    case 4:
        do_command(u);
        break;
    case 5:
        do_command(s);
        break;
    default:
        do_command(Command("echo 'No such command!'"));
    }

    return 0;
}