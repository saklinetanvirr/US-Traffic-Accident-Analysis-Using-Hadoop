import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class WeatherCountMapper
        extends Mapper<LongWritable, Text, Text, IntWritable> {

    private final static IntWritable one = new IntWritable(1);
    private Text weather = new Text();

    public void map(LongWritable key, Text value, Context context)
            throws IOException, InterruptedException {

        String line = value.toString();

        // Skip header
        if (line.startsWith("ID")) {
            return;
        }

        String[] fields = line.split(",");

        try {

            // Column index:
            // 0 ID
            // 1 Severity
            // 2 Start_Time
            // 3 Year
            // 4 Month
            // 5 Hour
            // 6 City
            // 7 State
            // 8 Weather_Condition

            String weatherCondition = fields[8];

            if (weatherCondition != null &&
                !weatherCondition.trim().isEmpty()) {

                weather.set(weatherCondition);

                context.write(weather, one);
            }

        } catch (Exception e) {

        }
    }
}