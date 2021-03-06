import haxe.Json;
import haxe.Timer;
import sys.io.File;

class JsonBenchmark {
	public function new() {
		var text:String = File.getContent("data/hxformat-schema.json");
		var startTime = Timer.stamp();

		var count:Int = 500;
		var schema:Any = Json.parse(text);
		var listOfSchema:Array<Any> = [];
		while (count-- > 0) {
			listOfSchema.push(schema);
		}
		count = 500;
		while (count-- > 0) {
			text = Json.stringify(schema);
			schema = Json.parse(text);
		}

		text = Json.stringify(listOfSchema);
		schema = Json.parse(text);

		printStats(Timer.stamp() - startTime);
	}

	function printStats(duration:Float) {
		var target = HaxeVersionsMacro.macroMapOutput2Target();
		Sys.println('$target;---;0;0;${Std.string(duration)}');
	}

	static function main() {
		try {
			new JsonBenchmark();
		} catch (e:Any) {
			trace(e);
		}
	}
}
