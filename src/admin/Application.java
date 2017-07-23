package admin;

import java.util.ArrayList;

import model.Excercise;
import model.Solution;
import model.User;
import sql.DbManager;

public class Application {

	public static void main(String[] args) {
//		User user = new User();
//		user.setEmail("b.xcytr@cde.pl")
//		.setUsername("b.xcytr")
//		.setPassword("Haslo321");
//		user.saveToDB();
		
//		User user1 = new User();
//		user1.setEmail("c.qwerty@abc.pl")
//		.setUsername("c.qwerty")
//		.setPassword("Haslo543");
//		user1.saveToDB();
//		System.out.println(user1); // powinienem dostać User z prawidłowo nadanym id
//		user1.delete();
//		System.out.println(user1); // powinieme dostać User z id = 0
		
		ArrayList<User> users = User.loadAllByGroupId(1);
		for(User _user: users){
			System.out.println(_user);
		}
		
		ArrayList<Excercise> exs = Excercise.loadAllByUserId(1);
		for(Excercise _ex: exs){
			System.out.println(_ex);
		}
		
		ArrayList<Solution> solutions = Solution.loadAllByExerciseId(1);
		for(Solution _sol: solutions){
			System.out.println(_sol);
		}
//		System.out.println(User.loadById(0)); // powinienem dostać null
//		System.out.println(User.loadById(1)); // powinienem dostać User
		closeApplication();
	}
	static void closeApplication(){
		DbManager.close();
		System.exit(0);
	}
}
