import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class StateCountMapper
        extends Mapper<LongWritable, Text, Text, IntWritable> {

    private final static IntWritable one = new IntWritable(1);
    private Text state = new Text();

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
            // 0=ID
            // 1=Severity
            // 2=Start_Time
            // 3=Year
            // 4=Month
            // 5=Hour
            // 6=City
            // 7=State

            String stateName = fields[7];

            state.set(stateName);

            context.write(state, one);

        } catch (Exception e) {

        }
    }
}