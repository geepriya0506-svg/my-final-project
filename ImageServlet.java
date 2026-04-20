    import java.io.*;
    import javax.servlet.*;
    import javax.servlet.http.*;

    public class ImageServlet extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            // Image file name from URL
            String imageName = request.getParameter("name");

            // C DRIVE IMAGE PATH
            String imagePath = "C:/ev_uploads/" + imageName;

            File imageFile = new File(imagePath);

            if (!imageFile.exists()) {
                return;
            }

            response.setContentType("image/jpeg");

            FileInputStream fis = new FileInputStream(imageFile);
            OutputStream os = response.getOutputStream();

            byte[] buffer = new byte[1024];
            int bytesRead;

            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }

            fis.close();
            os.close();
        }
    }
