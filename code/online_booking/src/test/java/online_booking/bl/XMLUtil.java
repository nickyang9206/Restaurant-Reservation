package online_booking.bl;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;


public class XMLUtil {
    public static void main(String[] args) throws IOException, DocumentException {
        log("login", "", "ok");
    }

    public static void log(String name, String content, String status) throws IOException {
        File logFile = new File("./log.xml");
        if (!logFile.exists()) {
            Document document = DocumentHelper.createDocument();
            document.addElement("logroot");
            FileWriter out = new FileWriter("./log.xml");
            document.write(out);
            out.close();
        }

        SAXReader reader = new SAXReader();
        Document document = null;
        InputStream is = new FileInputStream(logFile);
        try {
            document = reader.read(is);
        } catch (DocumentException e) {
            is.close();
            logFile.delete();
            log(name, content, status);
            return;
        }

        Element root = document.getRootElement();
        Element logEl = root.addElement("log");
        logEl.addAttribute("name", name);
        logEl.addAttribute("name", name);
        logEl.addAttribute("content", content);
        logEl.addAttribute("status", status);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        logEl.addAttribute("time", df.format(new Date()));
        FileWriter out = new FileWriter("./log.xml");
        document.write(out);
        out.close();
    }
}
