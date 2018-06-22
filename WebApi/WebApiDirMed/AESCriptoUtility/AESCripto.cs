using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace AESCriptoUtility
{
    public class AESCripto
    {
        /// <summary>
        /// Autor: César Augusto Rivera Rivas
        /// Fecha:19/12/2017
        /// Descripción: Metodo Privado estatico que desencripta un array de byte por su key y vector de inicialización
        /// </summary>
        /// <param name="cipherText">Texto cifrado</param>
        /// <param name="key">Key</param>
        /// <param name="iv">Vector de inicialización</param>
        /// <returns>string texto descifrado</returns>
        private static string DesencriptarStringFromBytes(byte[] cipherText, byte[] key, byte[] iv)
        {
            // Inicio de Validacón Argumentos
            if (cipherText == null || cipherText.Length <= 0)
            {
                throw new ArgumentNullException("texto cifrado vacío");
            }
            if (key == null || key.Length <= 0)
            {
                throw new ArgumentNullException("key vacía");
            }
            if (iv == null || iv.Length <= 0)
            {
                throw new ArgumentNullException("vector de inicialización vacío");
            }

            // Validación para el Key
            // Solo se permiten las siguiente la siguientes combinaciones 128-bit, 192-bit, or 256-bit
            // por lo cual si la key es menor a 16 se realiza un resize a 16 y si supera los 16 pero no completa los 32 bytes
            // se realiza el resize a 32
            if (key.Length > 0 & key.Length < 16)
                Array.Resize(ref key, 16);
            if ((key.Length > 16 & key.Length < 32) || key.Length > 32)
                Array.Resize(ref key, 32);

            //Validación para el vector de inicialización el cual cuando el array de bytes ya que el algoritmo solo soporta para el 
            // el vector de inicialización el mismo tamaño que el blocksize 128-bit

            if (iv.Length > 0 & (iv.Length < 16 || iv.Length > 16))
                Array.Resize(ref iv, 16);

            //Declaración de string para contener el texto descifrado
            string plaintext = null;

            // Crea un objeto RijndaelManaged  con su especifico key and IV.  
            using (var rijAlg = new RijndaelManaged())
            {
                //Settings  
                rijAlg.Mode = CipherMode.CBC;
                rijAlg.Padding = PaddingMode.ISO10126;
                rijAlg.FeedbackSize = 128;

                rijAlg.Key = key;
                rijAlg.IV = iv;

                // Crea un decrytor para la tranformación del stream.  
                var decryptor = rijAlg.CreateDecryptor(rijAlg.Key, rijAlg.IV);

                try
                {
                    // Crea un stream para la desencripción
                    using (var msDecrypt = new MemoryStream(cipherText))
                    {
                        using (var csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                        {

                            using (var srDecrypt = new StreamReader(csDecrypt))
                            {
                                // Lee los bytes desencriptados del strem y los coloca en variable stream
                                plaintext = srDecrypt.ReadToEnd();

                            }

                        }
                    }
                }
                catch
                {
                    plaintext = "Key o IV Incorrecto";
                }
            }

            return plaintext;
        }
        /// <summary>
        /// Autor: César Augusto Rivera Rivas
        /// Fecha:19/12/2017
        /// Descripción: Metodo Privado estatico que encripta un string por su key y vector de inicialización
        /// </summary>
        /// <param name="plainText">Texto a encriptar</param>
        /// <param name="key">Key</param>
        /// <param name="iv">Vector de Inicialización</param>
        /// <returns>Array de Bytes con texto cifrado</returns>
        private static byte[] EncriptarStringToBytes(string plainText, byte[] key, byte[] iv)
        {
            // Inicio de Validacón Argumentos
            if (plainText == null || plainText.Length <= 0)
            {
                throw new ArgumentNullException("plainText");
            }
            if (key == null || key.Length <= 0)
            {
                throw new ArgumentNullException("key");
            }
            if (iv == null || iv.Length <= 0)
            {
                throw new ArgumentNullException("key");
            }

            // Validación para el Key
            // Solo se permiten las siguiente la siguientes combinaciones 128-bit, 192-bit, or 256-bit
            // por lo cual si la key es menor a 16 se realiza un resize a 16 y si supera los 16 pero no completa los 32 bytes
            // se realiza el resize a 32
            if (key.Length > 0 & key.Length < 16)
                Array.Resize(ref key, 16);
            if ((key.Length > 16 & key.Length < 32) || key.Length > 32)
                Array.Resize(ref key, 32);

            //Validación para el vector de inicialización el cual cuando el array de bytes ya que el algoritmo solo soporta para el 
            // el vector de inicialización el mismo tamaño que el blocksize 128-bit

            if (iv.Length > 0 & (iv.Length < 16 || iv.Length > 16))
                Array.Resize(ref iv, 16);

            //Declaración de array de byte para contener el texto cifrado
            byte[] encrypted;
            // Crea un objeto RijndaelManaged  con su especifico key and IV.  
            using (var rijAlg = new RijndaelManaged())
            {
                rijAlg.Mode = CipherMode.CBC;
                rijAlg.Padding = PaddingMode.ISO10126;
                rijAlg.FeedbackSize = 128;

                rijAlg.Key = key;
                rijAlg.IV = iv;

                // Crea un encriptor para la tranformación del stream.  
                var encryptor = rijAlg.CreateEncryptor(rijAlg.Key, rijAlg.IV);

                // Crea un stream para la encripción del texto
                using (var msEncrypt = new MemoryStream())
                {
                    using (var csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (var swEncrypt = new StreamWriter(csEncrypt))
                        {
                            //Escribe texto en el stream
                            swEncrypt.Write(plainText);
                        }
                        encrypted = msEncrypt.ToArray();
                    }
                }
            }
            // Retorna array de bytes del memory stream
            return encrypted;
        }

        /// <summary>
        /// Autor: César Augusto Rivera Rivas
        /// Fecha:19/12/2017
        /// Descripción: Metodo publico estatico que desencripta un texto cifrado proporcionando key y vector de inicialización
        /// </summary>
        /// <param name="textocifrado">Texto cifrado</param>
        /// <param name="key">Key</param>
        /// <param name="iv">Vector de inicialización</param>
        /// <returns>string con texto desencriptado</returns>
        public static string DecryptStringAES(string textocifrado, string key, string iv)
        {
            var textocifradobytes = Convert.FromBase64String(textocifrado);

            var keybytes = Encoding.UTF8.GetBytes(key);
            var ivbytes = Encoding.UTF8.GetBytes(iv);

            var textodecrypt = DesencriptarStringFromBytes(textocifradobytes, keybytes, ivbytes);

            return string.Format(textodecrypt);
        }
        /// <summary>
        /// Autor: César Augusto Rivera Rivas
        /// Fecha:19/12/2017
        /// Descripción: Metodo publico estatico que encripta un texto proporcionando key y vector de inicialización
        /// </summary>
        /// <param name="texto">texto a cifrar</param>
        /// <param name="key">key</param>
        /// <param name="iv">vector de inicialización</param>
        /// <returns>string con texto encriptado</returns>
        public static string EncryptStringAES(string texto, string key, string iv)
        {

            var keybytes = Encoding.UTF8.GetBytes(key);
            var ivbytes = Encoding.UTF8.GetBytes(iv);

            var textocifradobytes = EncriptarStringToBytes(texto, keybytes, ivbytes);

            return Convert.ToBase64String(textocifradobytes);
        }
    }
}