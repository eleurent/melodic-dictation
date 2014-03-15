function fig = plot_image(x,y,z,axes,titre)
    fig = figure;
    imagesc(x,y,z);
    axis xy;
    if not (isempty(axes))
        axis(axes);
    end
    title(titre);
    cmap = colormap('jet');
    set(gca, 'color', cmap(1,:))