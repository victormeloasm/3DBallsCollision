function SphereCollision3D

    global vel vel2 vel3 radius color1 color2 color3 pos pos2 pos3 width scene_height depth stopAnimation;
    width = 600;
    scene_height = 600;
    depth = 600;

    x = width / 2;
    y = scene_height / 2;
    z = depth / 2;

    pos = [x y z];
    pos2 = [x/2 y/2 z/2];
    pos3 = [x y/2 z*3/4];
    vel = [2, 3, 2];
    vel2 = [3, -2, -2];
    vel3 = [-2, -3, 1];

    radius = 20;
    color1 = 'red';
    color2 = 'green';
    color3 = 'blue';

    stopAnimation = false;

    outputVideo = VideoWriter('sphere_collision_animation.mp4', 'MPEG-4');
    outputVideo.FrameRate = 60;
    open(outputVideo);

    fig = figure(1);
    set(fig, 'Position', [100, 100, 800, 600]);

    draw_spheres_3D(outputVideo);

    close(outputVideo);

end

function draw_spheres_3D(outputVideo)

    global vel vel2 vel3 radius color1 color2 color3 pos pos2 pos3 width scene_height depth stopAnimation;

    interval = 1 / 500;

    fig = gcf;

    while ~stopAnimation
        if pos(1) + radius > width || pos(1) - radius < 0
            vel(1) = -vel(1);
        end
        if pos(2) + radius > scene_height || pos(2) - radius < 0
            vel(2) = -vel(2);
        end
        if pos(3) + radius > depth || pos(3) - radius < 0
            vel(3) = -vel(3);
        end

        if pos2(1) + radius > width || pos2(1) - radius < 0
            vel2(1) = -vel2(1);
        end
        if pos2(2) + radius > scene_height || pos2(2) - radius < 0
            vel2(2) = -vel2(2);
        end
        if pos2(3) + radius > depth || pos2(3) - radius < 0
            vel2(3) = -vel2(3);
        end

        if pos3(1) + radius > width || pos3(1) - radius < 0
            vel3(1) = -vel3(1);
        end
        if pos3(2) + radius > scene_height || pos3(2) - radius < 0
            vel3(2) = -vel3(2);
        end
        if pos3(3) + radius > depth || pos3(3) - radius < 0
            vel3(3) = -vel3(3);
        end

        pos = pos + vel;
        pos2 = pos2 + vel2;
        pos3 = pos3 + vel3;

        cla;
        draw_sphere(pos, radius, color1);
        hold on;
        draw_sphere(pos2, radius, color2);
        draw_sphere(pos3, radius, color3);
        xlim([0, width]);
        ylim([0, scene_height]);
        zlim([0, depth]);

        frame = getframe(fig);
        writeVideo(outputVideo, frame);

        if norm(pos - pos2) < 2 * radius || norm(pos - pos3) < 2 * radius || norm(pos2 - pos3) < 2 * radius
            if norm(pos - pos2) > 2 * radius - 0.1 || norm(pos - pos3) > 2 * radius - 0.1 || norm(pos2 - pos3) > 2 * radius - 0.1
                disp('Collision........')
                xi = (pos(1) + pos2(1) + pos3(1)) / 3;
                yi = (pos(2) + pos2(2) + pos3(2)) / 3;
                zi = (pos(3) + pos2(3) + pos3(3)) / 3;
                text(xi, yi, zi, 'COLLISION!', 'FontSize', 20, 'Color', 'black', 'HorizontalAlignment', 'center');
                hold off;
                break;
            end
        end

        pause(interval);
    end

end

function draw_sphere(center, radius, color)
    [X,Y,Z] = sphere(20);
    X = X * radius + center(1);
    Y = Y * radius + center(2);
    Z = Z * radius + center(3);

    scatter3(X(:), Y(:), Z(:), 50, color, 'filled');
end
