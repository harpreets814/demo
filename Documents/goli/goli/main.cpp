//
//  main.cpp
//  goli
//
//  Created by Harpreet Singh on 06/11/25.
//

#include <iostream>
using namespace std;

class a {
private:
    int jona;
public:
    void get_jona() {
        cout << "Enter jona: ";
        cin >> jona;
    }
    void put_jona() {
        cout << "jona = " << jona << endl;
    }
};


class b : virtual public a {
private:
    int moda;
public:
    void get_moda() {
        cout << "Enter moda: ";
        cin >> moda;
    }
    void put_moda() {
        cout << "moda = " << moda << endl;
    }
};


class c : virtual public a {
private:
    int krishn;
public:
    void get_krishn() {
        cout << "Enter krishn: ";
        cin >> krishn;
    }
    void put_krishn() {
        cout << "krishn = " << krishn << endl;
    }
};

// Class D inherits from both B and C
class D : public b, public c {
private:
    int final_value;
public:
    void get_final() {
        cout << "Enter final_value: ";
        cin >> final_value;
    }
    void put_final() {
        cout << "final_value = " << final_value << endl;
    }

    void show_all() {
        put_jona();
        put_moda();
        put_krishn();
        put_final();
    }
};


class Baap {
public:
    void show() {
        cout << "Function of Class Baap" << endl;
    }
};


class cat {
public:
    void show() {
        cout << "Function of Class cat" << endl;
    }
};


class C : public Baap, public cat {
   
};

int main() {
    D obj;

    cout << "--- Enter Data ---" << endl;
    obj.get_jona();
    obj.get_moda();
    obj.get_krishn();
    obj.get_final();

    cout << "\n--- Display Data ---" << endl;
    obj.show_all();

    return 0;
}



