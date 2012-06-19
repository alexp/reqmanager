package pl.edu.pjwstk.reqmanager;

import org.xhtmlrenderer.*;
import sun.misc.BASE64Decoder;
import java.net.*;
import java.io.*;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xhtmlrenderer.extend.ReplacedElement;
import org.xhtmlrenderer.extend.ReplacedElementFactory;
import org.xhtmlrenderer.extend.UserAgentCallback;
import org.xhtmlrenderer.layout.LayoutContext;
import org.xhtmlrenderer.render.BlockBox;
import org.xhtmlrenderer.simple.extend.FormSubmissionListener;
import org.xhtmlrenderer.swing.EmptyReplacedElement;
import org.xhtmlrenderer.swing.ImageReplacedElement;
import org.xhtmlrenderer.swing.SwingReplacedElement;
import org.xhtmlrenderer.swing.SwingReplacedElementFactory;
import org.xhtmlrenderer.util.ImageUtil;
import org.xhtmlrenderer.pdf.ITextImageElement;
import org.xhtmlrenderer.pdf.*;
import com.lowagie.text.pdf.*;
import org.xhtmlrenderer.extend.FSImage;
import com.lowagie.text.BadElementException;
import com.lowagie.text.Image;

public class ProfileImageReplacedElementFactory implements ReplacedElementFactory {

    private final ReplacedElementFactory superFactory;

    public ProfileImageReplacedElementFactory(ReplacedElementFactory superFactory) {
        this.superFactory = superFactory;
    }

    @Override
    public ReplacedElement createReplacedElement(LayoutContext layoutContext, BlockBox blockBox,
            UserAgentCallback userAgentCallback, int cssWidth, int cssHeight) {

        Element element = blockBox.getElement();
        if (element == null) {
            return null;
        }

        String nodeName = element.getNodeName();
        String className = element.getAttribute("class");
        String id = element.getAttribute("id");
        if ("div".equals(nodeName) && className.contains("diagramImage")) {

            InputStream input = null;

            try {
                URL local = new URL("http://localhost:8080/reqmanager/requirement/getDiagramImage/" + id);
  
                URLConnection lc = local.openConnection();

                input = lc.getInputStream();

                BASE64Decoder decoder = new BASE64Decoder();
                byte[] bytes = decoder.decodeBuffer(input); 
                Image image = Image.getInstance(bytes);
                FSImage fsImage = new ITextFSImage(image);

                if (fsImage != null) {
                    if ((cssWidth != -1) || (cssHeight != -1)) {
                      fsImage.scale(cssWidth, cssHeight);
                    }
                    return new ITextImageElement(fsImage);
                }
            } catch (Exception e) {
              System.out.println(e);
            } finally {
            }
        }

        return superFactory.createReplacedElement(layoutContext, blockBox, userAgentCallback, cssWidth, cssHeight);
    }

    @Override
    public void reset() {
        superFactory.reset();
    }

    @Override
    public void remove(Element e) {
        superFactory.remove(e);
    }

    @Override
    public void setFormSubmissionListener(FormSubmissionListener listener) {
        superFactory.setFormSubmissionListener(listener);
    }
}
