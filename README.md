### Database
# Flight Management
- In this project, we will understand:
1. What is the role of Databases in an organization's information systems and explain basic concepts of databases, database systems, and the relational data model
2. Apply *the ERD model* to model the data of the Databases at the basic level
3. Detect, describe, and declare constraints on data
- Password to enter the field, please contract me. Thank you !


#### 1/ Database Schema

###### a.`KHACHHANG(MAKH, TEN, DCHI, DTHOAI)`
- Describre: Each customer has a code to distinguish them from the others, with name, address and phone number to contact

   
###### b.`NHANVIEN(MANV,TEN, DCHI, DTHOAI, LUONG, LOAINV)`
- Describre: Each airline employee has a name, salary, address, phone number, and a unique employee code to distinguish him/her from other employees. If the employee is a **pilot**, the *LOAINV* attribute value is 1, if the employee is a **flight attendant**, the *LOAINV* value is 0

###### c.`LOAIMB(MALOAI, HANGSX)`
- Describre: Each aircraft type has a type code to distinguish it from other aircraft and is manufactured by a single airline

###### d.`MAYBAY(SOHIEU, MALOAI)`
- Describre: Each aircraft has a serial number to distinguish it from other aircraft in the same class.

###### e.`CHUYENBAY(MACB, SBDI, SBDEN, GIODI, GIODEN)`
- Describre: A flight has a flight code to distinguish it from other flights. Each flight departs from one airport *SBDI* and lands at another airport *SBDEN*; departs at one hour *GIODI* and lands at another *GIODEN*.

###### f.`LICHBAY(NGAYDI, MACB, SOHIEU, MALOAI)`
- Describre: Each flight can have multiple flight schedules. Each flight schedule is identified by a specific departure date *NGAYDI* and flight code. A specific flight schedule using only one aircraft. Assume that each flight can only be arranged at most once per day.

###### g.`DATCHO(MAKH, NGAYDI, MACB)`
- Describre: Each customer can make a reservation according to the flight schedule provided by the airline. Assume that each customer is only allowed to book a maximum of one seat on a flight on a particular date.

###### h.`KHANANG(MANV, MALOAI)`
- Describre: A pilot's ability to fly an aircraft is represented by the *KHANANG* relation. A pilot can fly many different types of aircraft, and conversely, each type of aircraft can have many capable pilots.

###### i.`PHANCONG(MANV, NGAYDI, MACB)`
- Describre: Employees are assigned to one or more flight schedules. Usually for pilots, they have to be assigned to fly aircraft that are suitable for their ability.
