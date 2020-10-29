package tracks.singlePlayer;

import java.util.Random;
import controller.PlanningAgent;

import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import tools.Utils;
import tracks.ArcadeMachine;

/**
 * Created with IntelliJ IDEA. User: Diego Date: 04/10/13 Time: 16:29 This is a
 * Java port from Tom Schaul's VGDL - https://github.com/schaul/py-vgdl
 */
@Command(name = "GVGAI-PDDL", description = "Launches a new GVGAI game played by a planning agent or by a human.",
		 mixinStandardHelpOptions = true, version = "1.0")
public class Test {

	@Option(names = {"-g", "--game"}, description = "Game to be played.", required = true)
	private int gameIdx;

	@Option(names = {"-l", "--level"}, description = "Level to be played.", required = true)
	private int levelIdx;

	@Option(names = {"-c", "--config"}, description = "YAML configuration file that will be used by the agent.")
	private String configurationFile;

	@Option(names = {"-d", "--debug"}, description = "Debug mode.")
	private boolean debugMode;

	@Option(names = {"-s", "--save"}, description = "Save runtime information (problems, plans and log).")
	private boolean saveOutput;

	@Option(names = {"--localhost"}, description = "Call planner running on localhost.")
	private boolean localHost;

    public static void main(String[] args) {
    	// Load commandline arguments
    	Test test = new Test();
    	CommandLine commandLine = new CommandLine(test);
    	commandLine.parseArgs(args);

    	// Display help or version information
    	if (commandLine.isUsageHelpRequested()) {
    		commandLine.usage(System.out);
    		return;
		} else if (commandLine.isVersionHelpRequested()) {
    		commandLine.printVersionHelp(System.out);
    		return;
		}

    	// Load available games
		String spGamesCollection = "examples/all_games_sp.csv";
    	String[][] games = Utils.readGames(spGamesCollection);

    	// Game settings
		boolean visuals = true;
		int seed = new Random().nextInt();

		// Game and level to play
		String gameName = games[test.gameIdx][1];
		String game = games[test.gameIdx][0];
		String level = game.replace(gameName, gameName + "_lvl" + test.levelIdx);

		// Controller
		String controller = "controller.PlanningAgent";

		// Find out if the game has to be played by a human or by the agent
		boolean humanPlayer = test.configurationFile == null;

		// Play game
		if (humanPlayer) {
			ArcadeMachine.playOneGame(game, level, null, seed);
		} else {
			PlanningAgent.setGameConfigFile(test.configurationFile);
			PlanningAgent.setDebugMode(test.debugMode);
			PlanningAgent.setSaveInformation(test.saveOutput);
			PlanningAgent.setLocalHost(test.localHost);
			ArcadeMachine.runOneGame(game, level, visuals, controller, null, seed, 0);
			PlanningAgent.displayStats();
		}
    }
}
