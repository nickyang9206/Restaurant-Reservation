package online_booking.bl.common;

import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import java.security.Key;

public class JwtUtil {
    public static Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);
}
