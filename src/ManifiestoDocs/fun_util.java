package ManifiestoDocs;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.DecimalFormat;

import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;


public class fun_util {
    public fun_util() {
    }

    public String EscribirArchivo(String contenido, String nombreArchivo, 
                                  String formato, String path) {
        String res = "fail";
        FileWriter fichero = null;
        PrintWriter pw = null;

        try {
            fichero = new FileWriter(path + nombreArchivo + "." + formato);
            pw = new PrintWriter(fichero);
            pw.println(contenido);
            res = "done";
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Nuevamente aprovechamos el finally para 
                // asegurarnos que se cierra el fichero.
                if (null != fichero) {
                    fichero.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }

        return res;
    }

    public String sqlclean(String qury) {
        qury = replace(qury, "'", "");
        qury = replace(qury, "[", "");
        qury = replace(qury, "%", "");
        qury = replace(qury, "_", "");
        qury = replace(qury, ";", "");

        return qury;
    }

    public static String replace(String source, String pattern, String replace) {
        if (source != null) {
            final int len = pattern.length();
            StringBuffer sb = new StringBuffer();
            int found = -1;
            int start = 0;

            while ((found = source.indexOf(pattern, start)) != -1) {
                sb.append(source.substring(start, found));
                sb.append(replace);
                start = found + len;
            }

            sb.append(source.substring(start));

            return sb.toString();
        } else {
            return "";
        }
    }

    public static String createzip(String[] filenames, String zipname) {
        String res = "error al crear archivo";

        // Create a buffer for reading the files
        byte[] buf = new byte[1024];

        try {
            // Create the ZIP file
            String outFilename = zipname;
            ZipOutputStream out = new ZipOutputStream(
                                          new FileOutputStream(outFilename));

            // Compress the files
            for (int i = 0; i < filenames.length; i++) {
                FileInputStream in = new FileInputStream(filenames[i]);


                // Add ZIP entry to output stream.
                out.putNextEntry(new ZipEntry(filenames[i]));

                // Transfer bytes from the file to the ZIP file
                int len;

                while ((len = in.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }


                // Complete the entry
                out.closeEntry();
                in.close();
            }

            out.close();
        } catch (IOException e) {
        }

        // Complete the ZIP file
        return res;
    }

    public static String createzipList(List filenames, String zipname, 
                                       String path) {
        String res = "error al crear archivo";
        int count = 0;

        // Create a buffer for reading the files
        byte[] buf = new byte[1024];
        String filename;
        //String file_path;
        String file_arch;

        try {
            // Create the ZIP file
            String outFilename = zipname;
            ZipOutputStream out = new ZipOutputStream(
                                          new FileOutputStream(outFilename));

            // Compress the files
            for (int i = 0; i < filenames.size(); i++) {
                filename = filenames.get(i).toString();
                //file_path = filename.substring(0,filename.lastIndexOf("/")+1);
                file_arch = filename.substring(filename.lastIndexOf("/")+1);
                

                //FileInputStream in = new FileInputStream(path + filename);
                FileInputStream in = new FileInputStream(filename);
                count++;


                // Add ZIP entry to output stream.
                out.putNextEntry(new ZipEntry(file_arch));

                // Transfer bytes from the file to the ZIP file
                int len;

                while ((len = in.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }


                // Complete the entry
                out.closeEntry();
                in.close();
            }

            DecimalFormat Currency = new DecimalFormat("#0.00 Kb");
            res = String.valueOf(count) + " Archivos - " + 
                  Currency.format(count * 0.854);
            out.close();
        } catch (IOException e) {
        }

        // Complete the ZIP file
        return res;
    }
}