package com.jetbrains.handson.mpp.mobile

expect fun platformName(): String

fun createApplicationScreenMessage(): String {
    return "Kotlin Rocks on ${platformName()}"
}

fun sum(a: Int, b: Int): Int {
    return a + b
}

class Person(val name: String, val surname: String) {

    fun getName() = name
    fun getSurname() = surname
}

fun getPersons(): List<Person> {
    return listOf(Person("Alice","Alicece"), Person("Bob","Bobob"))
}

fun getPersonsAsync(callback: (List<Person>) -> Unit) {
    //GlobalScope.launch {
        //delay(10000)
        //callback(getPersons().asReversed())
    //}
    callback(getPersons().asReversed())
}
