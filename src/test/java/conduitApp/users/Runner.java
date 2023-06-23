package conduitApp.users;

import com.intuit.karate.junit5.Karate;

class Runner {
    
    @Karate.Test
//    Karate testUsers() { return Karate.run("/feature/Articles.feature").relativeTo(getClass()); }

    Karate testUsers() {
        return Karate.run().tags("@GeneralTest").relativeTo(getClass());
    }
}
