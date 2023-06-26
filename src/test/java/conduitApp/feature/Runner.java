package conduitApp.feature;

import com.intuit.karate.junit5.Karate;

class Runner {
    
    @Karate.Test
//    Karate testUsers() { return Karate.run("/feature/Articles.feature").relativeTo(getClass()); }

    Karate testUsers() {
        return Karate.run().tags("@Articles_02").relativeTo(getClass());
    }

    // mvn test -Dkarate.options="--tags @GeneralTest"
}
